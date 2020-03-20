## Messages of RocketChat

Script created for sent messages of Zabbix via Rocket Chat. For use this script
**_rocket-mensageria.sh_**. Move or copy of its for the directory of zabbix

`
/usr/lib/zabbix/alertscripts
`

After run the command below to change the permission of script for execution:

```sheel
chmod +x rocket-mensageria.sh
```

The script use 4 parameters show below:

* User: user of Rocket Chat service.
* Password: password of user of Rocket Chat service.
* Channel Name: name of the channel of Rocket Chat.
* Message: message of monitoring informed of Zabbix.

Sample of run the script

```bash

./rocket-mensageria.sh my-user my-password my-channel message of alert

```

### Pré requirement

You have to obtain the value of USER-ID. For get the value run the command below

```shell
curl http://rocket.chat/api/v1/login \
     -d "user=myusername&password=mypassword"
```

If you have sucess of this command you will see the output below

```json
{
  "status": "success",
  "data": {
      "authToken": "9HqLlyZOugoStsXCUfD_0YdwnNnunAJF8V47U3QHXSq",
      "userId": "aobEdbYhXfu5hkeqG",
      "me": {
            "_id": "aYjNnig8BEAWeQzMh",
            "name": "Rocket Cat",
            "emails": [
                {
                  "address": "rocket.cat@rocket.chat",
                  "verified": false
                }
            ],
            "status": "offline",
            "statusConnection": "offline",
            "username": "rocket.cat",
            "utcOffset": -3,
            "active": true,
            "roles": [
                "admin"
            ],
            "settings": {
                "preferences": {}
              },
            "avatarUrl": "http://localhost:3000/avatar/test"
        }
   }
}
```

Copy the value of userId and past in the **rocket-mensageria.sh** at variable _USER_ID_. For more information see the documentation of API of Rocket Chat. [Rocket Doc API](https://rocket.chat/docs/developer-guides/rest-api/)


After this steps. It's necessary create one Media type in Zabbix of type Script. Show tip in Documentation of Zabbix. [Zabbix Media Type](https://www.zabbix.com/documentation/current/manual/config/notifications/media).

Other configuration necessary for run. It's create on Action for link your media type. See in Zabbix
[Zabbix Actions](https://www.zabbix.com/documentation/current/manual/config/notifications/action)



