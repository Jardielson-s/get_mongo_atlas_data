class UserService:
    def __init__(self, mongo_client) -> None:
        self.mongo_client = mongo_client

    def get_data(self):
        users = self.mongo_client.users.find()
        for user in users:
            print(user)