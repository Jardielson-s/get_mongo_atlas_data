import boto3
import logging
from botocore.exceptions import ClientError
from bson import json_util
import json
import datetime


class S3:
    def __init__(self) -> None:
        self.s3_client = boto3.client("s3")

    def upload_file(self, file_name, bucket, array):
        try:
            date_now = datetime.datetime.now()
            file_name = "year={}/month={}/day={}/{}".format(
                date_now.year, date_now.month, date_now.day, file_name
            )
            json_string = json_util.dumps(array)
            self.s3_client.put_object(Bucket=bucket, Key=file_name, Body=json_string)
        except ClientError as error:
            return error
        return True
