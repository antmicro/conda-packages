TAG_GIT_URL=$(cat $PACKAGE/meta.yaml | grep "git_url" | awk '{print $2}')
TAG_GIT_REV=$(cat $PACKAGE/meta.yaml | grep "git_rev" | awk '{print $2}')
TAG_PATTERN=${TAG_PATTERN:-"v[0-9]*\.[0-9]*"}

TAG_GIT_DIR=$CONDA_PATH/conda-bld/git_cache/$(echo "$TAG_GIT_URL" | grep -o '://.*' | cut -f3- -d/)

git clone --mirror --branch "$TAG_GIT_REV" "$TAG_GIT_URL" $TAG_GIT_DIR

TAG_DESC_OUT=$(GIT_DIR=$TAG_GIT_DIR git describe --tags --long HEAD --first-parent --match "$TAG_PATTERN")

TAG_OLD_IFS=$IFS

IFS='-'

read -ra TAG_DESC_ARR <<< "$TAG_DESC_OUT"

if [ ${#TAG_DESC_ARR[@]} == 3 ]; then
    export PKG_TAG=${TAG_DESC_ARR[0]}
    export PKG_NUMBER=${TAG_DESC_ARR[1]}
    export PKG_GIT_HASH=${TAG_DESC_ARR[2]}
else
    export PKG_TAG="v0.0"
    export PKG_NUMBER=$(GIT_DIR=$TAG_GIT_DIR git rev-list --count HEAD)
    export PKG_GIT_HASH=g$(GIT_DIR=$TAG_GIT_DIR git rev-parse --short HEAD)
fi

IFS=$TAG_OLD_IFS

echo "     PKG_TAG: $PKG_TAG"
echo "  PKG_NUMBER: $PKG_NUMBER"
echo "PKG_GIT_HASH: $PKG_GIT_HASH"
