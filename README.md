## Messages of RocketChat

Script created to send messages from Zabbix via Rocket Chat. For use this script
**_rocket-mensageria.sh_**. 
Move or copy to the follow Zabbix directory. 

`
/usr/lib/zabbix/alertscripts
`

Run the command below to change the script execution permission:

```sheel
chmod +x rocket-mensageria.sh
```

The script use 4 parameters listened below:

* User: Rocket Chat service user.
* Password: Rocket Chat service password.
* Channel Name: Rocket Chat channel name.
* Message: monitoring message of Zabbix.

Sample run of the script

```bash

./rocket-mensageria.sh my-user my-password my-channel message of alert

```

### Pré requirement

You have to obtain the value of USER-ID. To get the value, run the command below:

```shell
curl http://rocket.chat/api/v1/login \
     -d "user=myusername&password=mypassword"
```

If you have succeeded on this command you will see the output below:

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

Copy the value of userId and past it in the **rocket-mensageria.sh** at variable _USER_ID_. For more information read the API documentation of Rocket Chat. [Rocket Doc API](https://rocket.chat/docs/developer-guides/rest-api/)


After these steps, it's necessary to create one Media type in Zabbix of type Script. Show tip in Documentation of Zabbix. [Zabbix Media Type](https://www.zabbix.com/documentation/current/manual/config/notifications/media).

Another configuration necessary to run, is create one Action to link your media type. See in Zabbix
[Zabbix Actions](https://www.zabbix.com/documentation/current/manual/config/notifications/action)



