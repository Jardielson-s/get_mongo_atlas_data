import os
import uuid
from src.infra.database.mongo_client import mongo_client
from src.infra.aws.s3.s3_config import S3


class UserService:
    def __init__(self, mongo_client) -> None:
        self.mongo_client = mongo_client

    def get_data(self):
        try:
            users = self.mongo_client.users.find()
            return list(users)
        except Exception as error:
            return error

    def upload_users(self):
        users = self.get_data()
        if type(users) == list and len(users) > 0:
            client_s3 = S3()
            bucket = os.getenv("BUCKET_NAME")
            file_name = "{}.json".format(uuid.uuid4())
            return client_s3.upload_file(
                bucket=bucket, file_name=file_name, array=users
            )
        return users
