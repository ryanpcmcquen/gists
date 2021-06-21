If you are receiving an error like this in Steam:
```
libGL error: No matching fbConfigs or visuals found
libGL error: failed to load driver: swrast
Steam: An X Error occurred
X Error of failed request:  GLXBadContext
Major opcode of failed request:  152
Serial number of failed request:  50
xerror_handler: X failed, continuing
Steam: An X Error occurred
```

Try installing the most recent `libnvidia-gl-*` i386 package, for example:

```
sudo apt-get install libnvidia-gl-418:i386
```