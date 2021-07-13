Add this to `~/.emacs.d/personal/custom.el` (or some other file in `~/.emacs.d/personal/`):

```lisp
(add-hook 'prelude-prog-mode-hook (lambda () (smartparens-mode -1)) t)
```