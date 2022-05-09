+++
title = "Jethro Kuan's way of braindump building"
author = ["System Administrator"]
tags = ["draft"]
draft = false
+++

## Basic idea {#basic-idea}

use `ox-hugo` to translate .org files into .md files. Resolving the `org-id` links along the way.


## Flow {#flow}

1.  `./build.py` wrote `./build.ninja` for translating every org file
2.  `./build.ninja` use `./publish.el` to do the translation.


### ./build.py {#dot-build-dot-py}

1.  take org file list using `glob.glob`
2.  write ninja rule and build script into `build.ninja`
3.  call ninja in the folder

<!--listend-->

```python
#!/usr/bin/env python

import glob
from pathlib import Path

files = glob.glob("org/*.org")

with open('build.ninja', 'w') as ninja_file:
    ninja_file.write("""
rule org2md
  command = emacs --batch -l ~/.emacs.d/init.el -l publish.el --eval \"(jethro/publish \\"$in\\")"
  description = org2md $in
""")

    for f in files:
	path = Path(f)
	output_file = f"content/posts/{path.with_suffix('.md').name}"
	ninja_file.write(f"""
build {output_file}: org2md {path}
""")

import subprocess
subprocess.call(["ninja"])
```


### ./build.ninja {#dot-build-dot-ninja}

```ninja
rule org2md
  command = emacs --batch -l ~/.emacs.d/init.el -l publish.el --eval "(jethro/publish \"$in\")"
  description = org2md $in

build content/posts/id3_algorithm.md: org2md org/id3_algorithm.org

build content/posts/decision_tree_learning.md: org2md org/decision_tree_learning.org

build content/posts/inbox.md: org2md org/inbox.org

build content/posts/density_estimation.md: org2md org/density_estimation.org

build content/posts/unsupervised_learning.md: org2md org/unsupervised_learning.org
```


#### problem {#problem}

<!--list-separator-->

-  no file found for use-package