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

2. With that program installed, create the "key" and accept the default prompts. Note, however, this only works if you have a single key you want to save; because I had multiple keys, I started naming them by the server they were assigned to:  
```
ssh-keygen -t rsa
```

If you wanted to name the key (in the following example, the server name is `pinky`, the prompts would look like this after you entered the above command. 
```
Enter file in which to save the key (/Users/do/.ssh/id_rsa): pinky
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in pinky.
```

3. Copy the key to the server:  
```
ssh-copy-id myname@theserver
```
And volia! Every time I log in in the future, no more password entry. 

If you named the key instead of using the default prompt, the program will look for unused keys and use what it finds (so if you do this one at a time you're fine). However you can also pass a `-n` flag to specify the key you want to use for that server. Thus, you could have used:

```
ssh-copy-id -n pinky myname@theserver
```
