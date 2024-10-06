# debian-arman

 A debian-repo to host all my debian packages.


Typical directory heirarchy of a debian repository: 

```python
.
|-- dists
|   `-- stable
|       |-- Release
|       `-- main
|           |-- binary-amd64
|           |   |-- Packages
|           |   `-- Packages.gz
|           `-- binary-arm64
|               |-- Packages
|               `-- Packages.gz
`-- pool
    `-- main
        `-- <letter>
            `-- <package-name>
                |-- <package-name>_<version>_<arch>.deb
                `-- <package-name>_<version>_<arch>.deb
```
