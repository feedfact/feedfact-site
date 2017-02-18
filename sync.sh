hugo --theme=after-dark --buildDrafts
aws s3 cp --recursive public s3://feedfact.org/ --profile tony
