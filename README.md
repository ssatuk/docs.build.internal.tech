# docs.build.internal.tech

This repository contains an Antora plybook that builds our internal technical documentation.

All instructions assume you are using bash or git-bash shell

## Local build and test
1. in the root of this repo run `./create-workspace.sh`
2. in the root of this repo run `npm install`
3.  `gulp` to create a live preview site
4.  read the file `local-antora-playbook.yml` to see which local folder corresponds to which document section
## Adding a remote document source
### for local editing 
1. edit `create-workspace.sh`, add relevant line for your remote document source
2. run `./create-workspace.sh`
3. edit `local-antora-playbook.yml`
4. REMEMBER to commit and push the changed `./create-workspace.sh` and `local-antora-playbook.yml`
5. in the root of this repo run `npm install` follwed by `gulp` to create a live preview site
6. edit local copy of relevant docs
7. when done, `cd workspace/<thedocfolder>`
8. git add, commit and push any changes

### for the published build

1. ensure correct permissions on remote repository - the relevant build agent must have access (TODO)
2. ensure build trigger hooks are set up on the remote (TODO)
3. edit `antora-playbook.yml`
4. commit and push



