FROM amazon/aws-cli

ENV DATASET=ds004552

# Entrypoint run with arg like aws s3 sync --no-sign-request s3://openneuro.org/<DATASET> <DATASET>
# ENTRYPOINT ["aws", "s3", "sync", "--no-sign-request", "s3://openneuro.org/$DATASET", "$DATASET"]
ENTRYPOINT aws s3 sync --no-sign-request s3://openneuro.org/$DATASET $DATASET

# docker run sample command: docker run -e DATASET=ds004560  openneuro-dataset:latest