## Usage

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

    helm repo add lalyos https://chart.lalyo.sh/

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run `helm search repo
lalyos` to see the charts.

To install the 12factor chart:

    helm install test lalyos/12factor

Custom values:
    helm upgrade -i test lalyos/12factor \
      --set title=Tuesday \
      --set color=mediumpurple \
      --set "body=this is easy" \
      --set tld=custom.k8z.eu