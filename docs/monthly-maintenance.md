# Monthly Developer Environment Maintenance

A list of procedures to ensure that the local environment is operating at its full potential.

## 1. Disable unwanted startup processes

Some newly installed applications are automatically set to run when starting your machine and run in the background. They can consume battery, reducing its duration and decreasing device performance. To disable those processes, you can access the Users & Groups settings in the System Preferences.

## 2. Reset the NVRAM & PRAM

NVRAM (nonvolatile random-access memory) is a small amount of memory that your Mac uses to store certain settings and access them quickly. PRAM (Parameter RAM) stores similar information, and the steps for resetting NVRAM and PRAM are the same.

Settings that can be stored in NVRAM include sound volume, display resolution, startup-disk selection, time zone, and recent kernel panic information. The settings stored in NVRAM depend on your Mac and the devices that you're using with your Mac.

Shut down your Mac, then turn it on and immediately press and hold these four keys together: **Option, Command, P, and R**. You can release the keys after about 20 seconds, during which your Mac might appear to restart. Release the keys after the second startup sound.

When your Mac finishes starting up, you might want to open System Preferences and adjust any settings that were reset, such as sound volume, display resolution, startup disk selection, or time zone.

## 3. Reset the SMC

1. Shut down your Mac.
2. On your built-in keyboard, press and hold all of these keys:
    - **Shift**  on the left side of your keyboard
    - **Control**  on the left side of your keyboard
    - **Option (Alt)**  on the left side of your keyboard
3. While holding all three keys, press and hold the power button as well.
4. Keep holding all four keys for 10 seconds.
5. Release all keys, then press the power button to turn on your Mac.

## 4. Clean the system cache

Day by day, your MacBook will store some information in the system cache such as system logs or big file cache for a faster startup, but in the long term, they become useless and only take space in the hard drive. To free some space in memory, you can access the folder that contains all these files and delete them.

1. Enter in the `~/Library/Caches` folder. You can quickly access the folder pressing the **Command + Shift + G** combination and copy/pasting the path.
2. Remove the files you think are unnecessary.

## 5. Clean the RAM with "purge"

Opening a lot of apps or web pages on the same session without reboot your MacBook can cumulate cached files also in your RAM and slow down the performance. To free this space and make available more memory for the system, run:

```sh
sudo purge
```
Enter password when prompted.