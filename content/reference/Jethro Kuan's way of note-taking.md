+++
title = "Jethro Kuan's way of note-taking"
author = ["System Administrator"]
tags = ["draft"]
draft = false
+++

## Machine {#machine}


### slipbox setup {#slipbox-setup}

```text
.
├── articles
├── main
├── reference
├── inbox.org
└── biblio.bib
```


### tools {#tools}

```emacs-lisp
(setq org-roam-capture-templates
    '(("m" "main" plain
       "%?"
       :if-new (file+head "main/${slug}.org"
			  "#+title: ${title}\n")
       :immediate-finish t
       :unnarrowed t)
      ("r" "reference" plain "%?"
       :if-new
       (file+head "reference/${title}.org" "#+title: ${title}\n")
       :immediate-finish t
       :unnarrowed t)
      ("a" "article" plain "%?"
       :if-new
       (file+head "articles/${title}.org" "#+title: ${title}\n#+filetags: :article:\n")
       :immediate-finish t
       :unnarrowed t)))

```

<div class="src-block-caption">
  <span class="src-block-number">Code Snippet 1</span>:
  capture template
</div>

```emacs-lisp
(cl-defmethod org-roam-node-type ((node org-roam-node))
  "Return the TYPE of NODE."
  (condition-case nil
      (file-name-nondirectory
       (directory-file-name
	(file-name-directory
	 (file-relative-name (org-roam-node-file node) org-roam-directory))))
    (error "")))
(setq org-roam-node-display-template
      (concat "${type:15} ${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
```

<div class="src-block-caption">
  <span class="src-block-number">Code Snippet 2</span>:
  property type display in find-node
</div>

```emacs-lisp
(push
      ;; other capture templates
      '("s" "Slipbox" entry  (file "~/Notes/RoamNotes/inbox.org")
       "* %?\n")
      org-capture-templates)

(defun jethro/org-capture-slipbox ()
  (interactive)
  (org-capture nil "s"))
```

<div class="src-block-caption">
  <span class="src-block-number">Code Snippet 3</span>:
  thought capturing(original)
</div>

```emacs-lisp
(defun jethro/org-roam-node-from-cite (keys-entries)
    (interactive (list (citar-select-ref :multiple nil :rebuild-cache t)))
    (let ((title (citar--format-entry-no-widths (cdr keys-entries)
						"${author editor} :: ${title}")))
      (org-roam-capture- :templates
			 '(("r" "reference" plain "%?" :if-new
			    (file+head "reference/${citekey}.org"
				       ":PROPERTIES:
:ROAM_REFS: [cite:@${citekey}]
:END:
#+title: ${title}\n")
			    :immediate-finish t
			    :unnarrowed t))
			 :info (list :citekey (car keys-entries))
			 :node (org-roam-node-create :title title)
			 :props '(:finalize find-file))))
```

<div class="src-block-caption">
  <span class="src-block-number">Code Snippet 4</span>:
  cite to refrence node
</div>

```emacs-lisp
(defun jethro/tag-new-node-as-draft ()
  (org-roam-tag-add '("draft")))
(add-hook 'org-roam-capture-new-node-hook #'jethro/tag-new-node-as-draft)
```

<div class="src-block-caption">
  <span class="src-block-number">Code Snippet 5</span>:
  make nodes tagged draft
</div>


### flow {#flow}


#### Reference notes {#reference-notes}

1.  [Find sources] Use _Zotero Web Connector_ to add source into _Zotero_
2.  [sync .bib] _BetterBibTex_ sync _Zotero Libray_ into `biblio.bib` in `org-roam-directory` path.
3.  [Generate Note] call `jethro/org-roam-node-from-cite`, select reference, and generate a note under `reference`.
4.  [Read and take note] Read the source, with multiple passes and anotation. Then jot the notes, link to existing zettels.


#### original thoughts {#original-thoughts}

1.  call `jethro/org-capture-slipbox` to capture thoughts into `inbox.org`.
2.  revisit notes in `inbox.org` after times, pass mature notes into `main`.


## Principles {#principles}


### Notes are to **serve** writer later on {#notes-are-to-serve-writer-later-on}


### Bad Behaviours {#bad-behaviours}


#### Too much notes (copying) {#too-much-notes--copying}


#### Note about everything {#note-about-everything}


#### Complex Note method {#complex-note-method}


### Benchmark for good Zettels {#benchmark-for-good-zettels}


#### Zettels should be Atomic {#zettels-should-be-atomic}


#### Encapsulated {#encapsulated}


### Keep Task management seperate {#keep-task-management-seperate}

Keep a centralized todo management, avoiding broke window in the Zettels.


#### my opinion {#my-opinion}

I don't quite agree to that. I like the window to be broken for a bit, I like to mess in the room without worrying breaking delicate glass vase

Though a neat and concise look out is cool. I could just put a subtree like that in the front, and problems solved.