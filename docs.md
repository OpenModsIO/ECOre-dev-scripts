# How to work on eCore mods
## What is Git??

Git is a thing which tracks changes to files. Imagine this file, notes.txt. It contains:
`Hi there!`

If we change it to
`Hi here!`

What's the difference? On line 1, four characters over, we deleted the letter t. That's what Git does - tracks code changes - so we can:
1. See what has changed when a team work on something
2. Go back to older changes if we break something
3. Work together.

On point three, imagine you removed the letter t, and I removed the first letter H. We both have these files, how do we merge the work we've done? Without Git, we have to copy/paste our changes. With Git, it remembers these two things:
- You removed the letter 't' from the fourth position on line 1
- I removed the letter 'H' from the first position on line 1

So to merge both of our changes, it simply applies those two changes to the one file, producing:
`i here!`

## What is GitHub?
GitHub is a place to store the files we work on, as well as the change history.


## Alright how do I get started?
1. Download Github Desktop: https://desktop.github.com/
2. After logging in, go to File -> Clone Repository. Select the repository you want to copy/clone, and put it somewhere easy to find for you. I put mine in a folder in Documents, eg Documents/Eco
3. Download Sublime Text: https://www.sublimetext.com/ - This is a code editing tool, it's better than notepad because notepad adds random characters to your code, and, Sublime Text helps colour your code to make it more readable.
4. Open Sublime Text, and drag the whole folder you just "cloned" into it.
5. After you make a change to the code, open GitHub Desktop. Each change you've made will appear here. Review them - make sure they're right! You can either highlight all the changes (Shift+click) or one at a time, and in the bottom-left, describe the changes for future readers to understand. Click Commit to main!
6. Almost done - at the top, you'll see Push Origin. Click it, and this will upload your changes. Now visit github.com and you'll see your changes there!

In the real world, you'll want to make a "branch" rather than "pushing to main". This lets others check what you did before we let the code in. To do this:
1. In GitHub Desktop, at the top click Current Branch then click New Branch
2. Give the new branch a name related to the changes you're making
3. That's it - follow the above process of Commit to {your branch name} in the bottom-left, then Pushing your code up (button at the top)

## How do I test mods I work on?

1. Download an Eco Server from https://play.eco
2. Unzip it somewhere. Go to the Mods folder, open UserCode folder
3. Copy the mod you've been working on, and paste it in the UserCode folder
4. Did the server launch? Success! Connect to it. If it didn't launch, go read the Logs folder in your Eco server. Make sure you're reading the newest log! It will tell you which file failed, and what line number, which gives you a clue.

