---
title: The Magical World of JuJu Charms, part 2
author: gabrielmougard
date: 2023-08-30 00:01:00 +0800
categories: [MAAS, JuJu, Cloud]
tags: [development]
pin: true
hidden: false
ascii_illustration: "
<div class=\"diagram\">
    <pre class=\"pink\">         Web interface & REST API        </pre>
    <pre>                     *                   </pre>
    <pre>                     ┆                   </pre>
    <pre>                     .                   </pre>
    <pre>                     +                   </pre>
    <pre>                     .                   </pre>
    <pre>                     *                   </pre>
    <pre class=\"blue\">   ┌╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴┐  </pre>
    <pre class=\"blue\">   ┆ (regiond)           ┆ pgsql,maas ┆  </pre>
    <pre class=\"blue\">   └╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴┘  </pre>
    <pre class=\"pink\">      DNS, NTP, Syslog, Squid Proxy      </pre>
    <pre>             .              .            </pre>
    <pre>            /                \\           </pre>
    <pre>           /                  \\          </pre>
    <pre>          *                    *         </pre>
    <pre class=\"blue\"> ┌╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴┐  ┌╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴┐</pre>
    <pre class=\"blue\"> ┆ (rackd)  ┆ maas ┆  ┆ (rackd)  ┆ maas ┆</pre>
    <pre class=\"blue\"> └╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴┘  └╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴┘</pre>
    <pre class=\"pink\">    PXE,IPMI,DCHP,       PXE,IPMI,DCHP,  </pre>
	<pre class=\"pink\">    TFTP,ISCI,NTP        TFTP,ISCI,NTP   </pre>
    <pre>          |                    |         </pre>
    <pre>  ┌╴╴╴╴╴╴╴╴ ...          ... ╴╴╴╴╴ ...   </pre>
    <pre>  ┆       ┆                    ┆         </pre>
    <pre class=\"blue\">┌╴╴╴╴┐  ┌╴╴╴╴┐               ┌╴╴╴╴┐      </pre>
    <pre class=\"blue\">┆ __ ┆  ┆ __ ┆               ┆ __ ┆      </pre>
    <pre class=\"blue\">┆ __ ┆  ┆ __ ┆               ┆ __ ┆      </pre>
    <pre class=\"blue\">┆    ┆  ┆    ┆               ┆    ┆      </pre>
    <pre class=\"blue\">┆ m0 ┆  ┆ m1 ┆   ...         ┆ mi ┆      </pre>
    <pre class=\"blue\">└╴╴╴╴┘  └╴╴╴╴┘               └╴╴╴╴┘      </pre>
</div>
"
custom_html_excerpt: "
<p>
    Ahoy, tech aficionados and cloud wranglers! 🤠 Before we dive into the cosmic wonders of JuJu, the magical spellbook for your cloud services, let's chat about its rockstar roadie, MAAS (Metal-as-a-Service). Why, you ask? Because JuJu may be the lead guitarist, but MAAS is the rhythm section! Imagine trying to launch into an epic cloud deployment solo without a backstage crew to set the stage—crazy talk! MAAS lays the groundwork, orchestrating your servers like a seasoned conductor before JuJu swoops in to make them sing. So, let’s pull back the curtain on MAAS first, the unsung hero that makes your cloud hit all the right notes! 🎵🌟
</p>
"
---

## Mastering MAAS: The Symphony of Server Management

Greetings, all you server whisperers and cloud cowboys! 🤠 Ever found yourself lost in a labyrinth of Linux commands, struggling to manage a sprawling data center? Well, tighten your seatbelts because we're diving headfirst into the marvelous world of [MAAS (Metal-as-a-Service)](https://maas.io), a service so nifty it makes managing your data center feel like conducting an orchestra—each server obediently playing its part in your digital symphony.

## A Brief Primer: The MAAS-tastic Architecture

MAAS has an architecture so neat it could give Marie Kondo a run for her money. Picture this: At the helm is a ‘Region Controller’ backed by a central Postgres database. This controller is your maestro, handling all your operator wishes via a dandy REST API. And then we've got 'Rack Controllers,' or as I like to call them, the “roadies” that set the stage, providing services like DHCP, IPMI, and PXE. But wait—there’s more! These controllers are stateless, horizontally scalable, and are basically the Swiss Army knives of local services. 🤯

### Rock-Solid Reliability: The MAAS High Availability Anthem

Your MAAS setup isn't just mission-critical; it's the backstage pass for your entire cloud and HPC setup. And it does high availability like Queen does rock anthems: flawlessly. Any hiccup in a Rack Controller? No worries. Your Region Controller is already doing the cha-cha with another gateway to keep the show going.

### Protocols, Physical Zones, and the Lifecycle of a Server Rockstar

From standard server protocols like IPMI and PXE to funky custom plugins—MAAS speaks every dialect in server-land. It's like the Rosetta Stone but for your data center. And let's not forget the 'Availability Zones,' which allow you to group servers by common failure points, enabling easy scaling across multiple domains. It’s like organizing your guitars by tuning, so you can grab the right one when the solo hits.

So you've got the basics of MAAS, the Metal-as-a-Service magnum opus that transforms your data center into a harmonized symphony. But what about the musicians—the servers themselves? Let's pop open the hood, or better yet, slide back the stage curtain, and take an encore look at the life of a server in the land of MAAS.

## 1️⃣ **New**: The Audition Phase

Imagine a fresh-faced musician strolling into an audition room, guitar case in hand. That's your new server. Once it's PXE-booted on a MAAS network, it's enlisted faster than you can say "Welcome to the band!" Now it's a part of the setup, ready to show off its BIOS, MAC addresses, and more. It's like your server is saying, "Hey, I know E minor, and I'm not afraid to use it!"

## 2️⃣ **Commissioning**: The Rehearsal

This is where we take our fresh server recruit and give them the full band rehearsal experience. We're talking detailed inventory—RAM, CPU, disks, NICs, and even GPU stats. It's like learning the entire setlist before the first gig. You can also add your own scripts for firmware updates, akin to customizing that Stratocaster for the perfect riff.

## 3️⃣ **Ready**: The Soundcheck

Ah, the soundcheck. That magical moment when everything is set, the mics are adjusted, and the instruments are in tune. That's the "Ready" phase. Your server is now like a seasoned musician with a well-tuned guitar, prepped and waiting in the wings for the curtain to rise. The BMC credentials are set, and MAAS can now turn it on or off faster than a stage light.

## 4️⃣ **Allocated**: The Setlist Finalization

Remember the fuss about which songs to play first? That's what happens in the "Allocated" phase. Now, the servers are allocated to users who get to choose the specifics, like network interface bonding, addressing, and disk configurations. It's like finalizing your setlist and adjusting the pedalboard before you go on stage.

## 5️⃣ **Deploying**: Showtime!

Cue the drumroll and let the spotlight hit! The servers are turned on, the operating system is installed, and we are LIVE! During deployment, MAAS configures everything—from network interfaces to disk partitions, all without you breaking a sweat. It’s the digital equivalent of nailing that guitar solo on the first try.

## 6️⃣ **Releasing**: The Afterparty Cleanup

The gig is over, the crowd has dispersed, and it's time to pack up. In the "Releasing" stage, the server is returned to the general pool, ready for its next adventure. Oh, and if you're worried about data remnants, you can have MAAS do a full disk wipe. Think of it as cleaning up after the afterparty so you’re ready for the next show.

## Let's rock now!

All right, keyboard warriors and shell script sorcerers, brace yourselves! 🧙‍♂️ We've been singing praises about the marvel that is MAAS, but what's a rock opera without a little action? Time to roll up those sleeves and grab your magic wand, otherwise known as your bash terminal. We're about to set up a MAAS cluster that's so solid, it'll make Stonehenge look like a Jenga game. Trust me, you'll want to echo "Let's rock!" because we're about to crank the volume up to 11 on this server show! 🎸🔥

What we want to do here is setup a local MAAS cluster of `N` machines using LXD VMs to emulate our bare metal machines. We will do it with `N=3` in this post but depending on your host resources, you might be able to scale this up to greater N values (`N=9` should be doable with 32GiB of RAM). In the end, we'll have a `setup.sh` script that bootstrap a cluster ready to be used as a JuJu MAAS cloud backend.

* First, let's setup LXD:

```bash
setup_lxd() {
	# Create project
	lxc project create maas-cloud
	lxc project switch maas-cloud

	# Setup default profile
	lxc profile device add default root disk pool=default path=/
	lxc profile device add default eth0 nic network=lxdbr0 name=eth0

	lxc config set core.https_address '::'
}
```

* Second, we setup the LXD network we want to use for our MAAS cluster:

```bash
# create a new network in the host's LXD and sets some environment variables that we
# will use later to configure MAAS and Juju within the `maas-cloud-mgr` container. DHCP
# is disabled on the network to allow MAAS to allocate IPs and PXE boot VMs. The host's
# LXD is the network gateway and also provides the LXD API on that IP.
# Both MAAS and Juju will interact with the host' LXD.
setup_lxd_network() {
	lxc network create cloudbr0 ipv4.dhcp=false ipv6.dhcp=false

	# MAASBR0_IPV4: host's LXD IP (in CIDR notation) on the cloudbr0 network
	MAASBR0_IPV4="$(lxc network get cloudbr0 ipv4.address)"

	# LXD_ADDRESS: host's LXD IP on the cloudbr0 network
	LXD_ADDRESS="$(echo "${MAASBR0_IPV4}" | cut -d/ -f1)"

	# MAAS_ETH1_IP: MAAS' eth1 IP (used for DHCP/TFTP/DNS/etc)
	MAAS_ETH1_IP="$(echo "${MAASBR0_IPV4}" | cut -d. -f1-3).2"

	# MAASBR0_GW: gateway IP of the cloudbr0 network
	MAASBR0_GW="$(echo "${MAASBR0_IPV4}" | cut -d/ -f1)"

	# MAASBR_*: vars to configure the MAAS subnet
	MAASBR0_NET_ADDRESS="$(echo "${MAASBR0_IPV4}" | cut -d. -f1-3).0"
	MAASBR0_NET_PREFIX="$(echo "${MAASBR0_IPV4}" | cut -d/ -f2)"
	MAASBR0_START_IP="$(echo "${MAASBR0_IPV4}" | cut -d. -f1-3).10"
	MAASBR0_END_IP="$(echo "${MAASBR0_IPV4}" | cut -d. -f1-3).100"
	MAASBR0_SUBNET_CIDR="${MAASBR0_NET_ADDRESS}/${MAASBR0_NET_PREFIX}"
}

```

* Third, we setup the container that will host MAAS and JuJu:

```bash
# creates the `maas-cloud-mgr` container that will host MAAS and Juju.
#   * add an extra  NIC to provide connectivity to MAAS VMs. MAAS will provide DHCP/TFTP/DNS/PXE
#     services on that network segment
#   * install needed packages
#   * install needed snaps
setup_maas_cloud_mgr() {
	lxc init images:ubuntu/jammy maas-cloud-mgr
	# MAAS needs an IP on its additional NIC for DHCP/TFTP/DNS/PXE/etc.
	lxc network attach cloudbr0 maas-cloud-mgr eth1 eth1
	cat <<EOF | lxc file push --uid 0 --gid 0 - maas-cloud-mgr/etc/netplan/eth1.yaml
network:
  version: 2
  ethernets:
    eth1:
      addresses:
        - ${MAAS_ETH1_IP}/24
EOF
	lxc start maas-cloud-mgr

	# Install dependencies, Juju and MAAS
	lxc exec maas-cloud-mgr -- apt-get install --no-install-recommends -y snapd jq
	lxc exec maas-cloud-mgr -- snap install juju --channel="${JUJU_SNAP_CHANNEL}"
	lxc exec maas-cloud-mgr -- snap install maas --channel="${MAAS_SNAP_CHANNEL}"
	lxc exec maas-cloud-mgr -- snap install maas-test-db --channel="${MAAS_SNAP_CHANNEL}"
}
```

* Now, it is time to configure MAAS. We will use the `maas-test-db` snap to bootstrap a MAAS cluster with a PostgreSQL database. We will also configure the MAAS subnet to match the LXD network we created earlier:

```bash
# creates a keypair and add it to the trust store of the host's LXD for API access
setup_lxd_key() {
	cn="${1}"
	if [ ! -e "${cn}.crt" ] || [ ! -e "${cn}.key" ]; then
		openssl req -x509 -newkey ec -pkeyopt ec_paramgen_curve:secp384r1 -sha384 -keyout "${cn}.key" -nodes -out "${cn}.crt" -days 3 -subj "/CN=${cn}"
	fi

	if ! lxc config trust ls -f csv | awk -F, '{print $3}' | grep -qxF "${cn}"; then
		echo "trusting ${cn} for maas-cloud project only"
		lxc config trust add "${cn}.crt" --name "${cn}" --projects maas-cloud --restricted
	fi
}

# configures MAAS:
#   * init the MAAS DB
#   * create an admin account
#   * create an account for Juju
#   * configure boot resources importation (images used for PXE install)
#   * tweak apt config to apply to MAAS managed VMs
#   * tweak some MAAS configuration settings
#   * create 3 rack tags
#   * configure the cloudbr0 network to provide DHCP
setup_maas() {
	setup_lxd_key "maas-cloud-juju"

	lxc exec maas-cloud-mgr -- maas init region+rack --database-uri maas-test-db:/// --maas-url http://0.0.0.0:5240/MAAS
	lxc exec maas-cloud-mgr -- maas createadmin --username admin --password password --email foo@example.com

	# ADMIN_MAAS_APIKEY: API key for admin user in MAAS
	ADMIN_MAAS_APIKEY="$(lxc exec maas-cloud-mgr -- maas apikey --username=admin)"
	lxc exec maas-cloud-mgr -- maas login admin http://127.0.0.1:5240/MAAS/api/2.0/ "${ADMIN_MAAS_APIKEY}"

	# create juju user
	lxc exec maas-cloud-mgr -- maas admin users create username=juju email=juju@example.com password=jujupassword is_superuser=0
	# JUJU_MAAS_APIKEY: API key for juju user in MAAS
	JUJU_MAAS_APIKEY="$(lxc exec maas-cloud-mgr -- maas apikey --username=juju)"

	# stop boot resources importation
	lxc exec maas-cloud-mgr -- maas admin boot-resources stop-import
	lxc exec maas-cloud-mgr -- maas admin maas set-config name=boot_images_auto_import value=false

	# speed up "apt-get update"
	lxc exec maas-cloud-mgr -- maas admin package-repository update 1 arches="amd64" disabled_components="multiverse,restricted" disabled_pockets="backports"
	lxc exec maas-cloud-mgr -- maas admin package-repository update 2 arches="arm64" disabled_components="multiverse,restricted" disabled_pockets="backports"

	# disable network discovery
	lxc exec maas-cloud-mgr -- maas admin maas set-config name=network_discovery value=disabled
	# skip the intro
	lxc exec maas-cloud-mgr -- maas admin maas set-config name=completed_intro value=true
	# disable GA
	lxc exec maas-cloud-mgr -- maas admin maas set-config name=enable_analytics value=false

	# create rack tags
	lxc exec maas-cloud-mgr -- maas admin tags create name="cloud-rack0"
	lxc exec maas-cloud-mgr -- maas admin tags create name="cloud-rack1"
	lxc exec maas-cloud-mgr -- maas admin tags create name="cloud-rack2"

	# configure cloudbr0 network
	lxc exec maas-cloud-mgr -- sh <<EOF
maas admin ipranges create type=dynamic start_ip="${MAASBR0_START_IP}" end_ip="${MAASBR0_END_IP}" comment='cloudbr0 reserved dynamic range'
maas admin subnet update "${MAASBR0_SUBNET_CIDR}" gateway_ip="${MAASBR0_GW}"

MAASBR0_FABRIC_ID="\$(maas admin subnet read "${MAASBR0_SUBNET_CIDR}" | jq -r '.vlan.fabric_id')"
PRIMARY_RACK_CONTROLLER="\$(maas admin rack-controllers read | jq -r '.[].hostname')"
maas admin vlan update "\${MAASBR0_FABRIC_ID}" "untagged" dhcp_on=True primary_rack="\${PRIMARY_RACK_CONTROLLER}"
EOF
}
```

* As of the writing of this post, the latest stable Ubuntu LTS release is 22.04 (Jammy). We will configure MAAS to use the Jammy release with GA kernel:

```bash
# configures MAAS to use Jammy image with GA kernel
#   * add 22.04 image
#   * import boot resources
#   * remove of the `lowlatency` flavor that MAAS insist on fetching
#   * remove the default 20.04 images
#   * make 22.04 the default distribution
maas_default_to_jammy() {
	# add 22.04 image (skip: HWE, -edge)
	lxc exec maas-cloud-mgr -- maas admin boot-source-selections create 1 os=ubuntu release=jammy arches=amd64 subarches="ga-22.04" labels="*"

	# start importing images
	# XXX: import must start before deleting boot-resources. Doing otherwise causes images to be fetched later on
	lxc exec maas-cloud-mgr -- maas admin boot-resources import
	sleep 10

	# no need for lowlatency flavor
	for id in $(lxc exec maas-cloud-mgr -- maas admin boot-resources read | jq -r '.[] | select(.architecture | contains("22.04-lowlatency")) | .id'); do
		lxc exec lxd-cloud-mgr -- maas admin boot-resource delete "${id}"
	done

	# remove 20.04 images to reclaim some space
	for id in $(lxc exec maas-cloud-mgr -- maas admin boot-resources read | jq -r '.[] | select(.name == "ubuntu/focal") | .id'); do
		lxc exec maas-cloud-mgr -- maas admin boot-resource delete "${id}"
	done

	lxc exec maas-cloud-mgr -- maas admin maas set-config name=commissioning_distro_series value=jammy
}
```

* Here is the fun JuJu bit ! We will configure JuJu to use our MAAS cluster as a cloud backend:

```bash
# configures Juju
#   * create needed directories
#   * setup the LXD cloud (host's LXD)
#   * use the LXD cloud to bootstrap a controller (another container on the host's LXD)
#   * setup the MAAS cloud
setup_juju() {
	setup_lxd_key "maas-cloud-juju"

	# workaround issues with juju snap strictly confined
	lxc exec maas-cloud-mgr -- mkdir -pm 0700 /root/.local/share/juju
	lxc exec maas-cloud-mgr -- mkdir -pm 0700 /root/.ssh

	# juju credential
	JUJU_CLIENT_CERT="$(sed 's/^/        /' maas-cloud-juju.crt)"
	JUJU_CLIENT_KEY="$(sed 's/^/        /' maas-cloud-juju.key)"
	LXD_SERVER_CERT="$(lxc info local: | sed -n '/BEGIN CERTIFICATE/, /END CERTIFICATE/ s/^ */        /p')"

	# setup clouds and credentials files
	lxc file push --uid 0 --gid 0 - maas-cloud-mgr/root/.local/share/juju/lxd-cloud.yaml <<EOF
clouds:
  lxd-cloud:
    type: lxd
    auth-types: [certificate]
    endpoint: https://${LXD_ADDRESS}:8443
    regions:
      default:
        endpoint: https://${LXD_ADDRESS}:8443
EOF
	lxc file push --uid 0 --gid 0 - maas-cloud-mgr/root/.local/share/juju/maas.yaml <<EOF
clouds:
  maas:
    type: maas
    auth-types: [oauth1]
    endpoint: http://${MAAS_ETH1_IP}:5240/MAAS
EOF

	lxc file push --uid 0 --gid 0 - maas-cloud-mgr/root/.local/share/juju/lxd-cloud-creds.yaml <<EOF
credentials:
  lxd-cloud:
    juju-controller:
      auth-type: certificate
      client-cert: |
${JUJU_CLIENT_CERT}
      client-key: |
${JUJU_CLIENT_KEY}
      server-cert: |
${LXD_SERVER_CERT}
EOF
	lxc file push --uid 0 --gid 0 - maas-cloud-mgr/root/.local/share/juju/maas-creds.yaml <<EOF
credentials:
  maas:
    maas:
      auth-type: oauth1
      maas-oauth: ${JUJU_MAAS_APIKEY}
EOF

	# setup clouds and credentials
	lxc exec maas-cloud-mgr -- juju add-cloud lxd-cloud -f /root/.local/share/juju/lxd-cloud.yaml
	lxc exec maas-cloud-mgr -- juju add-credential lxd-cloud -f /root/.local/share/juju/lxd-cloud-creds.yaml

	# bootstrap a Juju controller on the host's LXD in the lxd-cloud project
	lxc exec maas-cloud-mgr -- juju bootstrap lxd-cloud ctrl --config project=lxd-cloud

	lxc exec maas-cloud-mgr -- juju add-cloud maas --client --controller ctrl -f /root/.local/share/juju/maas.yaml
	lxc exec maas-cloud-mgr -- juju add-credential maas --client --controller ctrl -f /root/.local/share/juju/maas-creds.yaml
}

```

* Finally, we create the VMs that will emulate our bare metal machines:

```bash
# waits for the boot resources and images to finish downloading
maas_wait_import() {
	# wait for resources and images to finish importing
	lxc exec maas-cloud-mgr -- sh <<EOF
echo -n "Waiting for boot-resources importation"
while maas admin boot-resources is-importing | jq -re '. == true' > /dev/null; do
    echo -n .
    sleep 3
done
echo " done"

echo -n "Waiting for boot-images importation"
CONTROLLER_SYSTEM_ID="\$(maas admin rack-controllers read | jq -r '.[0] | .system_id')"
while maas admin rack-controller list-boot-images "\${CONTROLLER_SYSTEM_ID}" | jq -re '.status != "synced"' > /dev/null; do
    echo -n .
    sleep 3
done
echo " done"
EOF
}

# creates a number of VMs using MAAS
#   * create empty VMs configured to PXE boot in LXD
#   * hook the VMs to MAAS
#   * add a rack tag to each VMs
maas_create_machines() {
	RACK_ID=0
	for i in $(seq -w 01 "${1}"); do
		# create a VM to be commissioned by MAAS
		lxc init --empty --vm -c limits.memory=2GiB -d eth0,boot.priority=10 --network cloudbr0 "vm${i}"
		MAC="$(lxc config get "vm${i}" volatile.eth0.hwaddr)"

		# hook the VM to MAAS
		lxc exec maas-cloud-mgr -- maas admin machines create \
			architecture="amd64" \
			subarchitecture="generic" \
			mac_addresses="${MAC}" \
			power_type="lxd" \
			power_parameters_project=lxd-cloud \
			power_parameters_certificate="$(cat maas-cloud.crt)" \
			power_parameters_key="$(cat maas-cloud.key)" \
			power_parameters_password="" \
			power_parameters_power_address="${LXD_ADDRESS}" \
			power_parameters_instance_name="vm${i}" \
			hostname="vm${i}"

		# show the system ID (needed when interacting with a machine using MAAS' CLI)
		SYSTEM_ID="$(lxc exec maas-cloud-mgr -- maas admin machines read hostname="vm${i}" | jq -r ".[] | .system_id")"
		echo "vm${i} has the system ID: ${SYSTEM_ID}"

		# add a rack tag
		lxc exec maas-cloud-mgr -- maas admin tag update-nodes "cloud-rack${RACK_ID}" add="${SYSTEM_ID}"
		RACK_ID="$(((RACK_ID + 1) % 3))"

		lxc exec maas-cloud-mgr -- maas admin machine commission "${SYSTEM_ID}" testing_scripts=none || true

		# once commissioned, a machine can then be deployed like this:
		# maas admin machine deploy "${SYSTEM_ID}" ossystem=ubuntu distro_series=jammy hwe_kernel=hwe-22.04
	done
}
```

* The final `setup.sh` script looks like this:

```bash
# parses command line arguments and overwrite the defaults
check_args() {
	while [ "${#}" -gt 0 ]; do
		case "${1}" in
		-m | --maas-instances)
			ARG_MAAS_INSTANCES="${2}"
			shift 2
			;;
		-*)
			echo "Unknown flag ${1}"
			exit 1
			;;
		esac
	done
}

ARG_MAAS_INSTANCES=3

check_args $@

setup_lxd
setup_lxd_network
setup_maas_cloud_mgr

setup_maas
maas_default_to_jammy

setup_juju
maas_wait_import
maas_create_machines "$ARG_MAAS_INSTANCES"
```

Amazing! Now you have a 3 node MAAS cluster that spins up LXD VMs to emulate the bare metal servers! In the next post, we will use this setup to deploy a JuJu charm and explore its lifecycle.

## 🎬 Curtain Call
And there you have it, the life of a server in the glam-rock world of MAAS, from the audition to the standing ovation. Each phase is a crucial act in the grand performance that is your data center, managed by the inimitable MAAS. So the next time you're orchestrating your servers, remember: you're not just managing metal, you're directing a rock opera of cloud computing proportions!

Ready to take your server ensemble on a world tour? With MAAS, every day is a sold-out performance! 🌟🎶