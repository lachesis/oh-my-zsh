typeset -gA _ohmy_dircache
_ohmy_dircache['_']=0
function _ohmy_in_type {
    d=$(pwd)
    typ=$1

    cache_key="${d}_${typ}"
    val=$_ohmy_dircache[$cache_key]
    if [[ "$val" == "" ]]; then
        val=1  # this is backwards - remember, 1 is bad!
        while [ "$d" != "" ]; do
          if [ -d "$d"/$typ ]; then
              val=0
              break
          fi
          d=${d%/*}
        done
    fi
    _ohmy_dircache[$cache_key]=$val
    return $val
}

function _ohmy_hg_fast {
    _ohmy_in_type .hg && hg $@
}

#function _ohmy_git_fast {
#    _ohmy_in_type .git && $@
#}
