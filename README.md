# Colony Survival Docker Server

Provides a dedicated linux server for Colony Survival running inside a Docker container. 

**Basic configuration**

Available environment variables:
| Variable | Value | Description |
| - | - | - |
| SERVER_NAME | `CS Docker Server` | Server name as it will show on the steam server list |
| SERVER_PASSWORD | `""` | Optional server password |
| SERVER_NETWORKTYPE | `SteamOnline` | Network setting of the server see https://colonysurvival.fandom.com/wiki/Dedicated_Server#Server_Administration for details |
| SERVER_GAMEPORT | `27016` | Game client port |
| SERVER_STEAMPORT | `27017` | Steam query port (allows the server to show up on the steam list) |
| SERVER_VAC | `true` | VAC settings |
| SERVER_VOLUME | `/app` | path for server files |



## Volumes

| Path | Description |
| - | - |
| /app | Persistent Server data. Change internally via ${SERVER_VOLUME} |

## Updating the server
Simply restart the container to trigger the update procedure.