Every time I'd log in to our compute cluster at the university I'd have to enter the following:
```
ssh myname@theserver
```
Then I'd have to enter some password. 

This was great when I had one server with data. By the time I finished up my degree there were five different servers I had to access for various projects, and not only was it a pain to remember the various passwords but I figured there must be an easier way to log in because the welcome message on every log in was telling me to use some sort of "key". I decided to ask the cluster administrator how to do that and it couldn't have been easier:  

Their suggestion worked in three steps:  
1. Use `brew` to install the program `ssh-copy-id`  
```
brew install ssh-copy-id
```

2. With that program installed, create the "key" and accept the default prompts (as I didn't see any reason to change the filename it provided):  
```
ssh-keygen -t rsa
```

3. Copy the key to the server:  
```
ssh-copy-id myname@theserver
```

And volia! Every time I log in in the future, no more password entry. 
