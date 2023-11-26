# How to Work on eCore Mods

## Introduction to Git

Git is a version control system that tracks changes in files. It's like keeping a history of what's changed in your project, so you can:

1. Track changes when collaborating.
2. Revert to previous versions if needed.
3. Merge changes seamlessly.

For example, if two people edit a file, one removing the letter 't' and the other removing the letter 'H' from "Hi there!", Git can combine these changes to make "i here!".

## What is GitHub?

GitHub is an online platform for storing your Git repositories. It stores your files and their change history, making collaboration easier.

## Getting Started with GitHub

1. **Set Up GitHub Desktop:**
   - Download [GitHub Desktop](https://desktop.github.com/).
   - Log in and clone the repository you want to work on (File -> Clone Repository).

2. **Choose a Code Editor:**
   - Download [Visual Studio 2022 (Community Edition)](https://visualstudio.microsoft.com/vs/community/). Unlike Visual Studio Code, which is a lightweight code editor, Visual Studio 2022 is a full-fledged IDE designed for complex software development. It offers advanced tools for debugging, version control, and project management, making it ideal for larger projects like Eco mod development.

3. **Open Your Project:**
   - Open the repository you cloned in Visual Studio 2022.

4. **Work with Branches:**
   - Instead of directly committing to the main branch, create a new branch for your changes in GitHub Desktop (Current Branch -> New Branch). Name your branch relevant to the changes you're making. This approach allows you to work on your features or fixes without affecting the main project.

5. **Make and Commit Changes:**
   - After editing in Visual Studio 2022, review your changes in GitHub Desktop.
   - Commit your changes by describing what you did, then click "Commit to [your branch name]".

6. **Push Your Changes:**
   - Click "Push Origin" to upload your changes to GitHub. If you're working on a branch, this will push your branch to the remote repository.

This process helps maintain a clean and organized codebase, making it easier for others to review your changes and for you to integrate your work into the main project when it's ready.

### Working with Branches

In Git, a branch is essentially a separate line of development. Think of it as a way to create your own workspace where you can make changes without affecting the main project (often referred to as the 'main' or 'master' branch). Once your changes are finalized and tested, they can be merged back into the main project.

Using branches is a best practice in software development. It allows multiple developers to work on different features or fixes simultaneously without interfering with each other's work. It also makes it easier to track changes and understand the history of specific features or fixes.

To work with branches in GitHub Desktop:
1. Create a New Branch in GitHub Desktop (Current Branch -> New Branch).
2. Name it related to the changes you're making.
3. Commit and push as usual, but to your new branch.

## Testing Your Mods

1. **Download Eco Server:**
   - Get it from [Eco Server](https://play.eco).

2. **Prepare for Testing:**
   - Unzip the server and navigate to the Mods/UserCode folder.
   - Copy your mod into this folder. The .cs file(s) and others can be placed directly here, or preferably in their own folder, for cleanliness.

3. **Launch and Test:**
   - Start the server and connect. If it fails, check the Logs folder for clues on what went wrong.

Remember, the Logs will indicate which file and line caused an issue, helping you debug more efficiently.
