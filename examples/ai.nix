{ config, pkgs, ... }:
let
	my-python-packages = python-packages: with python-packages; [
		tensorflow
		pytorch
		numpy
		virtualenv
		pandas
  	]; 
  	python-with-my-packages = pkgs.python3.withPackages my-python-packages;
in {
	programs.zsh.shellAliases = {
		virtualenv="virtualenv --python=${pkgs.python3}/bin/python --system-site-packages" ;
	};
	environment = {
		systemPackages = with pkgs; [
			python-with-my-packages vscode
		];
		interactiveShellInit = ''
			alias pip="PIP_PREFIX='$(pwd)/_build/pip_packages' \pip"
            export PYTHONPATH="$(pwd)/_build/pip_packages/lib/python2.7/site-packages:$PYTHONPATH"
            unset SOURCE_DATE_EPOCH
		'';
	};
}
