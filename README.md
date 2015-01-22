# Pass

> Probably use oauth here somewhere

Home's authentication and permission.

- Identify people
- Manage permissions
- Owner invites others to home to grant access

<!---->

    //pass.local
    /
        {
            "uid": "pass",
            "name": "Pass",

            "key": "",
            "secret": "",
        }

## Keys

Permissions.

- Granularity?
    + Apps
    + Resources
    + Methods

> What if we namespaced the keys for granularity

    *
    app:*
    app:resource:*

    app
    app:resource
    app:resource:method

<!---->

    /keys
        [Key]

        /<key>
            {
                "uid": "door",
                "name": "Can open door",
            }

            {
                "uid": "harmony",
                "name": "Can control music"
            }

            /homies
                [Homie]

    /groups
        [Group]

        /<group>
            {
                "uid": "owners",
                "name": "Owners",
                "keys": ["door", "harmony"]
            }

            {
                "uid": "guests",
                "name": "Guests",
                "keys": ["harmony"]
            }

            /homies
                [Homie]

## Homies

Identifies a person. Homies can connect to others.

- Support pets? :D

<!---->

    /homies
        [Homie]

        /<homie>
            {
                "uid": "jessethegame",
                "name": "Jesse",
                "image": "http://example.com/image.jpg",
                "pin": "shortandeasy",
                "password": "longandhardandnotplaintext",
            }
            /keys
                [Key]
            /groups
                [Group]
            /homies
                [Homie]


# Auth
Every request should contain the secret token in a header

X-Home-Pass: <secret>

1. match the token to the Pass database
2. check for the required Key
