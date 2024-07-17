## Resetting a system to a clean state

```powershell

\Windows\System32\sysprep\sysprep /generalize /oobe /mode:vm /shutdown

```

This will reset the system to a default state, but will not rename the computer from its randomly generated name. This is useful for creating a new VM template.