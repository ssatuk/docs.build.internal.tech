# this script will generate the local workspace

function create_sparse_clone {
  # args are:
  # $1 name of directory to create under workspace
  # $2 remote to clone
  # $3 git sparse checkout argument
  # $4 optional branch to checkout

  if [ ! -d ./workspace/$1 ]; then
   echo "Creating local copy of $1 docs"
   cd ./workspace
   git clone --filter=blob:none --no-checkout $2 $1
   cd $1
   git sparse-checkout init --cone
   git sparse-checkout set $3
   git checkout $4
   cd ../..
  else echo "Skipping ./workspace/$1 as exists"
  fi

}

mkdir -p ./workspace

create_sparse_clone bi  git@github.com:ssatuk/docs.src.bi.git tech
create_sparse_clone docmetatech git@github.com:ssatuk/docs.src.documentation.git tech
create_sparse_clone flows  git@bitbucket.org:ssat/ssat.flows.team.git docs/tech
create_sparse_clone learn  git@github.com:ssatuk/docs.src.learn.git tech
create_sparse_clone learn-tf   git@github.com:ssatuk/terraform-do-learn.git docs
create_sparse_clone ma  git@github.com:ssatuk/SSAT.EAI.MarketingAutomation.git doc
create_sparse_clone processes  git@github.com:ssatuk/docs.src.processes.git tech
create_sparse_clone ssat.xrm.apps.tm  git@bitbucket.org:ssat/ssat.xrm.apps.tm.git docs/tech
create_sparse_clone web   https://ssatgitbot:tb4wBa5mZ9ScLcrrzXt6@bitbucket.org/ssat/ssat.web.master.git docs docs
create_sparse_clone xrm2xero git@github.com:ssatuk/Xrm2Xero.git doc
create_sparse_clone ssat.xrm.code.membership git@bitbucket.org:ssat/ssat.xrm.code.membership.git docs/tech
create_sparse_clone ssat.xrm.code.general git@bitbucket.org:ssat/ssat.xrm.code.general.git docs/tech
