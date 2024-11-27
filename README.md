# 👩‍💻 Server-side chat.AddText Implementation
- The function [chat.AddText](https://wiki.facepunch.com/gmod/chat.AddText) can only be used client-side
- This function allows for coloured chat messages which are clearer to read, and generally look nicer
- The only function to send a chat message to a client built in, is the [PrintMessage](https://wiki.facepunch.com/gmod/Global.PrintMessage) function
- Whilst chat.AddText allows for colours, PrintMessage does not, which means a work-around is needed
## 💭 How can I use it?
- On the server, we can call this function with the following parameters

```Kieran:AddText(player, Color(121, 247, 121), "Kieran | ", Color(255, 255, 255), "What a nice test message, have ", Color(107, 224, 237), "£1")```
- The first parameter must be a valid player, or it will broadcast the message to all connected players 
- There can be unlimited parameters for the next parameters, as long as it repeats as a colour and then the string
- This function would send the following to player: $${\color{lightgreen}Kieran \space  | \space}$$ What a nice test message, have $${\color{lightblue} \space£1}$$
## 💨 Why is this better than other solutions?
- The only other way to utilise chat.AddText on the server is by using [net.WriteTable](https://wiki.facepunch.com/gmod/net.WriteTable)
- Sending invidual data types instead of a data structure that will need to be convert to JSON, is much faster and frees up server resources
- In a net message, the server sends the number of arguments as an unsigned integer, so the client knows how many net strings and net colours have been sent
- The client can then read the net message elements via a loop, using the amount of arguments as a range, storing them in a table
- This table is unpacked and used as parameters for the client.AddText function 
