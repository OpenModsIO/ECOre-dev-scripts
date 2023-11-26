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
   - Download from [GitHub Desktop](https://desktop.github.com/).
   - Log in and clone the repository you want to work on (File -> Clone Repository).

2. **Choose a Code Editor:**
   - Download [Visual Studio 2022 (Community Edition)](https://visualstudio.microsoft.com/vs/community/). This integrated development environment (IDE) is more than just a code editor; it offers advanced tools for debugging, version control, and project management, making it ideal for larger projects.
   - Be sure not to confuse it with Visual Studio Code. Visual Studio 2022 is a full-fledged IDE designed for complex software development, offering robust tools and features. Visual Studio Code, on the other hand, is a lightweight but powerful code editor that's great for simpler projects and supports a wide range of programming languages. For Eco mod development, the comprehensive tools available in Visual Studio 2022 are more suitable.

3. **Open Your Project:**
   - Open Sublime Text and drag the cloned folder into it.

4. **Make and Commit Changes:**
   - After editing, open GitHub Desktop. Review your changes.
   - Commit your changes by describing what you did, then click "Commit to main".

5. **Push Your Changes:**
   - Click "Push Origin" to upload your changes to GitHub.

### Working with Branches

Instead of committing directly to the main branch, it's better to create a new branch for your changes:

1. Create a New Branch in GitHub Desktop (Current Branch -> New Branch).
2. Name it related to the changes you're making.
3. Commit and push as usual, but to your new branch.

## Testing Your Mods

1. **Download Eco Server:**
   - Get it from [Eco Server](https://play.eco).

2. **Prepare for Testing:**
   - Unzip the server and navigate to the Mods/UserCode folder.
   - Copy your mod into this folder.

3. **Launch and Test:**
   - Start the server and connect. If it fails, check the Logs folder for clues on what went wrong.

Remember, the Logs will indicate which file and line caused an issue, helping you debug more efficiently.
