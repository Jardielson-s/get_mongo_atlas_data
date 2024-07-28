
from src.infra.database.mongo_client import mongo_client
from src.module.users.services.user_service import UserService


def lambda_handler(event, context):
    user_service = UserService(mongo_client=mongo_client())
    user_service.get_data()