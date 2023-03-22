on:
  pull_request:
    paths:
      - 'PLAIN_LIST'
      - 'regenerate_filters.sh'

jobs:
  generate_links:
    runs-on: ubuntu-latest
    permissions:
      # Give the default GITHUB_TOKEN write permission to commit and push the changed files back to the repository.
      contents: write
    steps:
    - uses: actions/checkout@v3
    - run: |
        chmod +x ./regenerate_filters.sh
        ./regenerate_filters.sh
        git config user.name github-actions
        git config user.email github-actions@github.com
    - uses: stefanzweifel/git-auto-commit-action@v4
      with:
        commit_message: Updated `LIST`
        file_pattern: LIST