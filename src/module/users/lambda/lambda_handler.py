import logging
from src.infra.database.mongo_client import mongo_client
from src.module.users.services.user_service import UserService


def lambda_handler(event, context):
    user_service = UserService(mongo_client=mongo_client())
    response = user_service.upload_users()
    if response == True:
        logging.info("Sync finished")
    elif type(response) == list:
        logging.info("No data to sync")
        logging.warning(response)
    else:
        logging.info("Sync not finished")
        logging.error(response)
