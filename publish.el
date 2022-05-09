
;; Set the package installation directory so that packages aren't stored in the
;; ~/.emacs.d/elpa path.
;;; Code:
(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))

(setq package-archives '(
			 ;; ("melpa" . "https://melpa.org/packages/")
			 ;; ("org" . "https://orgmode.org/elpa/")
			 ;; ("elpa" . "https://elpa.gnu.org/packages/")
			 ;; Tsinghua mirror use it when in China
			 ("gnu"   . "http://elpa.emacs-china.org/gnu/")
			 ("melpa" . "http://elpa.emacs-china.org/melpa/")
			 ("org" . "http://elpa.emacs-china.org/org/")
			 ))


;; Initialize the package system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; (package-install 'use-package)
;; (require 'use-package)
;; Install dependencies
(package-install 'org)

(require 'org)
;; (add-to-list 'load-path (org-find-library-dir "org"))
;; (add-to-list 'load-path "./ol")

;(prin1 load-path)
;(prin1 (directory-files-recursively "/usr/share/emacs/26.3/lisp/org" ""))
;; (prin1 load-path)
(package-install 'find-lisp)
(package-install 'ox-hugo)
(package-install 'org-roam)
;; Load the publishing system
;; (prin1 (org-version  current-prefix-arg t (not current-prefix-arg) ))
(require 'org-roam)
(require 'ox-hugo)
(require 'find-lisp)
;;change roam-directory to ".", so that after the agenda, the search for ID will visit "."
(setq org-roam-directory default-directory)
(setq org-agenda-files nil)

(defun hermanhel/braindump-publish (file)
  (with-current-buffer (find-file-noselect file)
     ;; (setq org-hugo-base-dir "../..")
    (setq org-hugo-base-dir
	  (if (equal "org"
		     (car (last (split-string (substring (file-name-directory file) 0 -1) "/"))))
	      ".."
	    "../.."
	      ))

    (let ((org-hugo-section "post")
	  (org-agenda-files nil)
	  (org-id-extra-files (find-lisp-find-files org-roam-directory "\.org$")))
      (org-hugo-export-wim-to-md))))
;; get all files in the directory. Note that `org-hugo-base-dir', if relative, is relative to the file. e.g.: for a/b/c.org, base-dir .. means b, while for a/d.org, base-dir .. means a.

;; in order to maintain the base-dir to be braindump, need to modify base-dir by file. lucky that there's only 2 depth possiblity.
(setq files
      (or   (with-temp-buffer
	      (insert-file-contents ".files")
	      (read (current-buffer)))
       (directory-files-recursively "./org" "\.org$")))
;;test
;;(car (last (split-string (substring (file-name-directory (car files)) 0 -1) "/")))
;;
;;(setq org-roam-db-location nil)

;;give everybody their hugo_secion
(dolist (file files)
  (with-temp-buffer
    (insert-file-contents file)
    (org-mode)
    (search-forward "#+title:")
    (end-of-line)
    (org-return)
    (insert (format "#+HUGO_SECTION:%s"
		    (nth 2 (split-string 
			    (file-name-directory  file)						      "/"))))
    ;;draft
    ;; (when
    ;; 	(and (org-roam-node-at-point)
    ;; 	 (member "draft" (org-roam-node-tags (org-roam-node-at-point))))
    ;;   (org-return)
    ;;   (insert  "#+HUGO_DRAFT: true"))
    (write-region (point-min) (point-max) file)
    )
  )
;;EXPORT_HUGO_DRAFT

(let ((org-agenda-files nil))
  (dolist (file files)
    (hermanhel/braindump-publish file)
    (delete file files)
    (with-temp-file ".files"
      (print files (current-buffer)))
    )
  (with-temp-file ".files"
    (print '() (current-buffer)))
 )



