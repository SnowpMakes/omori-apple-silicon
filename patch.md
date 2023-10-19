# Patch script

*How do I apply the patch?*

### Preparation

Make sure you have Steam installed, and OMORI is downloaded within Steam. Launch the game at least once after downloading it. It'll probably crash but that's okay.

### Download

Download the patch script (omori-apple-silicon-patch.command) from the [releases](https://github.com/SnowpMakes/omori-apple-silicon/releases/tag/v1.0.0) page.

### Run the patch

Within Finder, control+click the patch script and choose `Open` to execute it. A terminal should pop up with progress information.

Once the process has finished, indicated by `Done!` in the output and `[Process completed]` at the bottom of the terminal, quit terminal and launch OMORI through Steam.

### Troubleshooting

If MacOS complains about the security of the file, or it's "not executable", open a Terminal within the enclosing folder of the script and execute `chmod +x ./omori-apple-silicon-patch.command`. After that, try running the patch again.

