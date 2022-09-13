======
Quincy
======

Quincy is the 17th stable release of Ceph.  It is named after Squidward
Quincy Tentacles from Spongebob Squarepants.

v17.2.4 Quincy
==============

This is the 4th  backport release in the Quincy series. We recommend
all users update to this release.

Notable Changes
---------------

* Cephfs: The 'AT_NO_ATTR_SYNC' macro is deprecated, please use the standard
  'AT_STATX_DONT_SYNC' macro. The 'AT_NO_ATTR_SYNC' macro will be removed in
  the future.

* OSD: The issue of high CPU utilization during recovery/backfill operations
  has been fixed. For more details, see: https://tracker.ceph.com/issues/56530.

* Trimming of PGLog dups is now controlled by the size instead of the version.
  This fixes the PGLog inflation issue that was happening when the on-line
  (in OSD) trimming got jammed after a PG split operation. Also, a new off-line
  mechanism has been added: `ceph-objectstore-tool` got `trim-pg-log-dups` op
  that targets situations where OSD is unable to boot due to those inflated dups.
  If that is the case, in OSD logs the "You can be hit by THE DUPS BUG" warning
  will be visible.
  Relevant tracker: https://tracker.ceph.com/issues/53729

Changelog
---------

* .readthedocs.yml: Always build latest doc/releases pages (`pr#47442 <https://github.com/ceph/ceph/pull/47442>`_, David Galloway)
* Add mapping for ernno:13 and adding path in error msg in opendir()/cephfs.pyx (`pr#46647 <https://github.com/ceph/ceph/pull/46647>`_, Sarthak0702)
* admin: Fix check if PR or release branch docs build (`pr#47739 <https://github.com/ceph/ceph/pull/47739>`_, David Galloway)
* backport doc/start: rewrite hardware-recs networks section (`pr#46652 <https://github.com/ceph/ceph/pull/46652>`_, Zac Dover)
* backport of cephadm: fix osd adoption with custom cluster name (`pr#46551 <https://github.com/ceph/ceph/pull/46551>`_, Adam King)
* backport: ceph-volume/tests: fix test_exception_returns_default (`pr#47435 <https://github.com/ceph/ceph/pull/47435>`_, Guillaume Abrioux)
* bdev: fix FTBFS on FreeBSD, keep the huge paged read buffers (`pr#44641 <https://github.com/ceph/ceph/pull/44641>`_, Radoslaw Zarzynski)
* build: Silence deprecation warnings from OpenSSL 3 (`pr#47585 <https://github.com/ceph/ceph/pull/47585>`_, Kefu Chai, Adam C. Emerson)
* Catch exception if thrown by __generate_command_map() (`pr#45892 <https://github.com/ceph/ceph/pull/45892>`_, Nikhil Kshirsagar)
* ceph-fuse: add dedicated snap stag map for each directory (`pr#46948 <https://github.com/ceph/ceph/pull/46948>`_, Xiubo Li)
* ceph-mixin: backport of recent cleanups (`pr#46548 <https://github.com/ceph/ceph/pull/46548>`_, Arthur Outhenin-Chalandre)
* ceph-volume: avoid unnecessary subprocess calls (`pr#46968 <https://github.com/ceph/ceph/pull/46968>`_, Guillaume Abrioux)
* ceph-volume: decrease number of `pvs` calls in `lvm list` (`pr#46966 <https://github.com/ceph/ceph/pull/46966>`_, Guillaume Abrioux)
* ceph-volume: do not call get_device_vgs() per devices (`pr#47348 <https://github.com/ceph/ceph/pull/47348>`_, Guillaume Abrioux)
* ceph-volume: do not log sensitive details (`pr#46728 <https://github.com/ceph/ceph/pull/46728>`_, Guillaume Abrioux)
* ceph-volume: fix `simple scan` (`pr#47149 <https://github.com/ceph/ceph/pull/47149>`_, Guillaume Abrioux)
* ceph-volume: fix fast device alloc size on mulitple device (`pr#47293 <https://github.com/ceph/ceph/pull/47293>`_, Arthur Outhenin-Chalandre)
* ceph-volume: make is_valid() optional (`pr#46730 <https://github.com/ceph/ceph/pull/46730>`_, Guillaume Abrioux)
* ceph-volume: only warn when config file isn't found (`pr#46070 <https://github.com/ceph/ceph/pull/46070>`_, Guillaume Abrioux)
* ceph-volume: Quincy backports (`pr#47406 <https://github.com/ceph/ceph/pull/47406>`_, Guillaume Abrioux, Zack Cerza, Michael Fritch)
* ceph-volume: system.get_mounts() refactor (`pr#47536 <https://github.com/ceph/ceph/pull/47536>`_, Guillaume Abrioux)
* ceph.spec.in backports (`pr#47549 <https://github.com/ceph/ceph/pull/47549>`_, David Galloway, Kefu Chai, Tim Serong, Casey Bodley, Radoslaw Zarzynski, Radosław Zarzyński)
* ceph.spec.in: disable system_pmdk on s390x (`pr#47251 <https://github.com/ceph/ceph/pull/47251>`_, Ken Dreyer)
* ceph.spec.in: openSUSE: require gcc11-c++, disable parquet (`pr#46155 <https://github.com/ceph/ceph/pull/46155>`_, Tim Serong)
* ceph.spec: fixing cephadm build deps (`pr#47069 <https://github.com/ceph/ceph/pull/47069>`_, Redouane Kachach)
* cephadm/ceph-volume: fix rm-cluster --zap (`pr#47626 <https://github.com/ceph/ceph/pull/47626>`_, Guillaume Abrioux)
* cephadm/mgr: adding logic to handle --no-overwrite for tuned profiles (`pr#47944 <https://github.com/ceph/ceph/pull/47944>`_, Redouane Kachach)
* cephadm: add "su root root" to cephadm.log logrotate config (`pr#47314 <https://github.com/ceph/ceph/pull/47314>`_, Adam King)
* cephadm: add 'is_paused' field in orch status output (`pr#46569 <https://github.com/ceph/ceph/pull/46569>`_, Guillaume Abrioux)
* Cephadm: Allow multiple virtual IP addresses for keepalived and haproxy (`pr#47610 <https://github.com/ceph/ceph/pull/47610>`_, Luis Domingues)
* cephadm: change default keepalived/haproxy container images (`pr#46714 <https://github.com/ceph/ceph/pull/46714>`_, Guillaume Abrioux)
* cephadm: fix incorrect warning (`pr#47608 <https://github.com/ceph/ceph/pull/47608>`_, Guillaume Abrioux)
* cephadm: Fix repo_gpgkey should return 2 vars (`pr#47374 <https://github.com/ceph/ceph/pull/47374>`_, Laurent Barbe)
* cephadm: improve message when removing osd (`pr#47071 <https://github.com/ceph/ceph/pull/47071>`_, Guillaume Abrioux)
* cephadm: preserve cephadm user during RPM upgrade (`pr#46790 <https://github.com/ceph/ceph/pull/46790>`_, Scott Shambarger)
* cephadm: reduce spam to cephadm.log (`pr#47313 <https://github.com/ceph/ceph/pull/47313>`_, Adam King)
* cephadm: Remove duplicated process args in promtail and loki (`pr#47654 <https://github.com/ceph/ceph/pull/47654>`_, jinhong.kim)
* cephadm: return nonzero exit code when applying spec fails in bootstrap (`pr#47952 <https://github.com/ceph/ceph/pull/47952>`_, Adam King)
* cephadm: support for Oracle Linux 8 (`pr#47656 <https://github.com/ceph/ceph/pull/47656>`_, Adam King)
* cephfs-shell: move source to separate subdirectory (`pr#47400 <https://github.com/ceph/ceph/pull/47400>`_, Tim Serong)
* cephfs-top: display average read/write/metadata latency (`issue#48619 <http://tracker.ceph.com/issues/48619>`_, `pr#47977 <https://github.com/ceph/ceph/pull/47977>`_, Venky Shankar)
* cephfs-top: fix the rsp/wsp display (`pr#47648 <https://github.com/ceph/ceph/pull/47648>`_, Jos Collin)
* client/fuse: Fix directory DACs overriding for root (`pr#46595 <https://github.com/ceph/ceph/pull/46595>`_, Kotresh HR)
* client: allow overwrites to file with size greater than the max_file_size (`pr#47971 <https://github.com/ceph/ceph/pull/47971>`_, Tamar Shacked)
* client: choose auth MDS for getxattr with the Xs caps (`pr#46800 <https://github.com/ceph/ceph/pull/46800>`_, Xiubo Li)
* client: do not release the global snaprealm until unmounting (`pr#46495 <https://github.com/ceph/ceph/pull/46495>`_, Xiubo Li)
* client: Inode::hold_caps_until is time from monotonic clock now (`pr#46563 <https://github.com/ceph/ceph/pull/46563>`_, Laura Flores, Neeraj Pratap Singh)
* cmake: disable LTO when building pmdk (`pr#47619 <https://github.com/ceph/ceph/pull/47619>`_, Kefu Chai)
* cmake: pass -Wno-error when building PMDK (`pr#46623 <https://github.com/ceph/ceph/pull/46623>`_, Ilya Dryomov)
* cmake: remove spaces in macro used for compiling cython code (`pr#47483 <https://github.com/ceph/ceph/pull/47483>`_, Kefu Chai)
* cmake: set $PATH for tests using jsonnet tools (`pr#47625 <https://github.com/ceph/ceph/pull/47625>`_, Kefu Chai)
* common/bl: fix FTBFS on C++11 due to C++17's if-with-initializer (`pr#46005 <https://github.com/ceph/ceph/pull/46005>`_, Radosław Zarzyński)
* common/win32,dokan: include bcrypt.h for NTSTATUS (`pr#48016 <https://github.com/ceph/ceph/pull/48016>`_, Lucian Petrut, Kefu Chai)
* common: fix FTBFS due to dout & need_dynamic on GCC-12 (`pr#46214 <https://github.com/ceph/ceph/pull/46214>`_, Radoslaw Zarzynski)
* common: use boost::shared_mutex on Windows (`pr#47493 <https://github.com/ceph/ceph/pull/47493>`_, Lucian Petrut)
* crash: pthread_mutex_lock() (`pr#47683 <https://github.com/ceph/ceph/pull/47683>`_, Patrick Donnelly)
* crimson: fixes for compiling with fmtlib v8 (`pr#47603 <https://github.com/ceph/ceph/pull/47603>`_, Adam C. Emerson, Kefu Chai)
* doc, crimson: document installing crimson with cephadm (`pr#47283 <https://github.com/ceph/ceph/pull/47283>`_, Radoslaw Zarzynski)
* doc/cephadm/services: fix example for specifying rgw placement (`pr#47947 <https://github.com/ceph/ceph/pull/47947>`_, Redouane Kachach)
* doc/cephadm/services: the config section of service specs (`pr#47068 <https://github.com/ceph/ceph/pull/47068>`_, Redouane Kachach)
* doc/cephadm: add note about OSDs being recreated to OSD removal section (`pr#47102 <https://github.com/ceph/ceph/pull/47102>`_, Adam King)
* doc/cephadm: Add post-upgrade section (`pr#47077 <https://github.com/ceph/ceph/pull/47077>`_, Redouane Kachach)
* doc/cephadm: document the new per-fsid cephadm conf location (`pr#47076 <https://github.com/ceph/ceph/pull/47076>`_, Redouane Kachach)
* doc/cephadm: enhancing daemon operations documentation (`pr#47074 <https://github.com/ceph/ceph/pull/47074>`_, Redouane Kachach)
* doc/cephadm: fix example for specifying networks for rgw (`pr#47806 <https://github.com/ceph/ceph/pull/47806>`_, Adam King)
* doc/dev: add context note to dev guide config (`pr#46818 <https://github.com/ceph/ceph/pull/46818>`_, Zac Dover)
* doc/dev: add Dependabot section to essentials.rst (`pr#47042 <https://github.com/ceph/ceph/pull/47042>`_, Zac Dover)
* doc/dev: add IRC registration instructions (`pr#46940 <https://github.com/ceph/ceph/pull/46940>`_, Zac Dover)
* doc/dev: edit delayed-delete.rst (`pr#47051 <https://github.com/ceph/ceph/pull/47051>`_, Zac Dover)
* doc/dev: Elaborate on boost .deb creation (`pr#47415 <https://github.com/ceph/ceph/pull/47415>`_, David Galloway)
* doc/dev: s/github/GitHub/ in essentials.rst (`pr#47048 <https://github.com/ceph/ceph/pull/47048>`_, Zac Dover)
* doc/dev: s/master/main/ essentials.rst dev guide (`pr#46661 <https://github.com/ceph/ceph/pull/46661>`_, Zac Dover)
* doc/dev: s/master/main/ in basic workflow (`pr#46703 <https://github.com/ceph/ceph/pull/46703>`_, Zac Dover)
* doc/dev: s/master/main/ in title (`pr#46721 <https://github.com/ceph/ceph/pull/46721>`_, Zac Dover)
* doc/dev: s/the the/the/ in basic-workflow.rst (`pr#46935 <https://github.com/ceph/ceph/pull/46935>`_, Zac Dover)
* doc/dev_guide: s/master/main in merging.rst (`pr#46709 <https://github.com/ceph/ceph/pull/46709>`_, Zac Dover)
* doc/index.rst: add link to Dev Guide basic workfl (`pr#46904 <https://github.com/ceph/ceph/pull/46904>`_, Zac Dover)
* doc/man/rbd: Mention changed `bluestore_min_alloc_size` (`pr#47579 <https://github.com/ceph/ceph/pull/47579>`_, Niklas Hambüchen)
* doc/mgr: add prompt directives to dashboard.rst (`pr#47822 <https://github.com/ceph/ceph/pull/47822>`_, Zac Dover)
* doc/mgr: edit orchestrator.rst (`pr#47780 <https://github.com/ceph/ceph/pull/47780>`_, Zac Dover)
* doc/mgr: update prompts in dboard.rst includes (`pr#47869 <https://github.com/ceph/ceph/pull/47869>`_, Zac Dover)
* doc/rados/operations: add prompts to operating.rst (`pr#47586 <https://github.com/ceph/ceph/pull/47586>`_, Zac Dover)
* doc/radosgw: Uppercase s3 (`pr#47359 <https://github.com/ceph/ceph/pull/47359>`_, Anthony D'Atri)
* doc/start: alphabetize hardware-recs links (`pr#46339 <https://github.com/ceph/ceph/pull/46339>`_, Zac Dover)
* doc/start: make OSD and MDS structures parallel (`pr#46655 <https://github.com/ceph/ceph/pull/46655>`_, Zac Dover)
* doc/start: Polish network section of hardware-recommendations.rst (`pr#46665 <https://github.com/ceph/ceph/pull/46665>`_, Anthony D'Atri)
* doc/start: rewrite CRUSH para (`pr#46658 <https://github.com/ceph/ceph/pull/46658>`_, Zac Dover)
* doc/start: update documenting-ceph branch names (`pr#47955 <https://github.com/ceph/ceph/pull/47955>`_, Zac Dover)
* doc/start: update hardware recs (`pr#47123 <https://github.com/ceph/ceph/pull/47123>`_, Zac Dover)
* doc: update docs for centralized logging (`pr#46946 <https://github.com/ceph/ceph/pull/46946>`_, Aashish Sharma)
* doc: Update release process doc to accurately reflect current process (`pr#47837 <https://github.com/ceph/ceph/pull/47837>`_, David Galloway)
* docs: fix doc link pointing to master in dashboard.rst (`pr#47789 <https://github.com/ceph/ceph/pull/47789>`_, Nizamudeen A)
* exporter: per node metric exporter (`pr#47629 <https://github.com/ceph/ceph/pull/47629>`_, Pere Diaz Bou, Avan Thakkar)
* include/buffer: include <memory> (`pr#47694 <https://github.com/ceph/ceph/pull/47694>`_, Kefu Chai)
* install-deps.sh: do not install libpmem from chacra (`pr#46900 <https://github.com/ceph/ceph/pull/46900>`_, Kefu Chai)
* install-deps: script exit on /ValueError: in centos_stream8 (`pr#47892 <https://github.com/ceph/ceph/pull/47892>`_, Nizamudeen A)
* libcephfs: define AT_NO_ATTR_SYNC back for backward compatibility (`pr#47861 <https://github.com/ceph/ceph/pull/47861>`_, Xiubo Li)
* libcephsqlite: ceph-mgr crashes when compiled with gcc12 (`pr#47270 <https://github.com/ceph/ceph/pull/47270>`_, Ganesh Maharaj Mahalingam)
* librados: rados_ioctx_destroy check for initialized ioctx (`pr#47452 <https://github.com/ceph/ceph/pull/47452>`_, Nitzan Mordechai)
* librbd/cache/pwl: narrow the scope of m_lock in write_image_cache_state() (`pr#47940 <https://github.com/ceph/ceph/pull/47940>`_, Ilya Dryomov, Yin Congmin)
* librbd: bail from schedule_request_lock() if already lock owner (`pr#47162 <https://github.com/ceph/ceph/pull/47162>`_, Christopher Hoffman)
* librbd: retry ENOENT in V2_REFRESH_PARENT as well (`pr#47996 <https://github.com/ceph/ceph/pull/47996>`_, Ilya Dryomov)
* librbd: tweak misleading "image is still primary" error message (`pr#47248 <https://github.com/ceph/ceph/pull/47248>`_, Ilya Dryomov)
* librbd: unlink newest mirror snapshot when at capacity, bump capacity (`pr#46594 <https://github.com/ceph/ceph/pull/46594>`_, Ilya Dryomov)
* librbd: update progress for non-existent objects on deep-copy (`pr#46910 <https://github.com/ceph/ceph/pull/46910>`_, Ilya Dryomov)
* librbd: use actual monitor addresses when creating a peer bootstrap token (`pr#47912 <https://github.com/ceph/ceph/pull/47912>`_, Ilya Dryomov)
* mds: do not assert early on when issuing client leases (`issue#54701 <http://tracker.ceph.com/issues/54701>`_, `pr#46566 <https://github.com/ceph/ceph/pull/46566>`_, Venky Shankar)
* mds: Don't blocklist clients in any replay state (`pr#47110 <https://github.com/ceph/ceph/pull/47110>`_, Kotresh HR)
* mds: fix crash when exporting unlinked dir (`pr#47181 <https://github.com/ceph/ceph/pull/47181>`_, 胡玮文)
* mds: notify the xattr_version to replica MDSes (`pr#47057 <https://github.com/ceph/ceph/pull/47057>`_, Xiubo Li)
* mds: skip fetching the dirfrags if not a directory (`pr#47432 <https://github.com/ceph/ceph/pull/47432>`_, Xiubo Li)
* mds: standby-replay daemon always removed in MDSMonitor::prepare_beacon (`pr#47281 <https://github.com/ceph/ceph/pull/47281>`_, Patrick Donnelly)
* mds: switch to use projected inode instead (`pr#47058 <https://github.com/ceph/ceph/pull/47058>`_, Xiubo Li)
* mgr, mon: Keep upto date metadata with mgr for MONs (`pr#46559 <https://github.com/ceph/ceph/pull/46559>`_, Laura Flores, Prashant D)
* mgr/cephadm: Add disk rescan feature to the orchestrator (`pr#47311 <https://github.com/ceph/ceph/pull/47311>`_, Adam King, Paul Cuzner)
* mgr/ceph

v17.2.3 Quincy
==============

This is a hotfix release that addresses a libcephsqlite crash in the mgr.

Notable Changes
---------------
* A libcephsqlite bug that caused the mgr to crash repeatedly and die is now
  fixed. The bug was exposed due to 17.2.2 being built with gcc 8.5.0-14, which contains
  a new patch to check for invalid regex. 17.2.1 was built using gcc 8.5.0-13, which
  does not contain the invalid regex patch.

  Relevant tracker: https://tracker.ceph.com/issues/55304

  Relevant BZ: https://bugzilla.redhat.com/show_bug.cgi?id=2110797

Changelog
---------

* libcephsqlite: ceph-mgr crashes when compiled with gcc12 (`pr#47270 <https://github.com/ceph/ceph/pull/47270>`_, Ganesh Maharaj Mahalingam)

v17.2.2 Quincy
==============

This is a hotfix release that resolves two security flaws.

Notable Changes
---------------
* Users who were running OpenStack Manila to export native CephFS, who
  upgraded their Ceph cluster from Nautilus (or earlier) to a later
  major version, were vulnerable to an attack by malicious users. The
  vulnerability allowed users to obtain access to arbitrary portions of
  the CephFS filesystem hierarchy, instead of being properly restricted
  to their own subvolumes. The vulnerability is due to a bug in the
  "volumes" plugin in Ceph Manager. This plugin is responsible for
  managing Ceph File System subvolumes which are used by OpenStack
  Manila services as a way to provide shares to Manila users.
  
  With this hotfix, the vulnerability is fixed. Administrators who are
  concerned they may have been impacted should audit the CephX keys in
  their cluster for proper path restrictions.
  
  Again, this vulnerability only impacts OpenStack Manila clusters which
  provided native CephFS access to their users.

* A regression made it possible to dereference a null pointer for
  for s3website requests that don't refer to a bucket resulting in an RGW
  segfault.

Changelog
---------
* mgr/volumes: Fix subvolume discover during upgrade (:ref:`CVE-2022-0670`, Kotresh HR)
* mgr/volumes: V2 Fix for test_subvolume_retain_snapshot_invalid_recreate (:ref:`CVE-2022-0670`, Kotresh HR)
* qa: validate subvolume discover on upgrade (Kotresh HR)
* rgw: s3website check for bucket before retargeting (Seena Fallah)

v17.2.1 Quincy
==============

This is the first bugfix release of Ceph Quincy.

Notable Changes
---------------
* The "BlueStore zero block detection" feature (first introduced to Quincy in
  https://github.com/ceph/ceph/pull/43337) has been turned off by default with a
  new global option called `bluestore_zero_block_detection`. This feature,
  intended for large-scale synthetic testing, does not interact well with some RBD
  and CephFS features. Any side effects experienced in previous Quincy versions
  would no longer occur, provided that the config option remains set to false.
  Relevant tracker: https://tracker.ceph.com/issues/55521

* telemetry: Added new Rook metrics to the 'basic' channel to report Rook's
  version, Kubernetes version, node metrics, etc.
  See a sample report with `ceph telemetry preview`.
  Opt-in with `ceph telemetry on`.

  For more details, see:

  https://docs.ceph.com/en/latest/mgr/telemetry/

* Add offline dup op trimming ability in the ceph-objectstore-tool.
  Relevant tracker: https://tracker.ceph.com/issues/53729

* Fixes a bug with cluster logs not being populated after log rotation.
  Relevant tracker: https://tracker.ceph.com/issues/55383

Changelog
---------
* .github/CODEOWNERS: tag core devs on core PRs (`pr#46519 <https://github.com/ceph/ceph/pull/46519>`_, Neha Ojha)
* .github: continue on error and reorder milestone step (`pr#46447 <https://github.com/ceph/ceph/pull/46447>`_, Ernesto Puerta)
* [quincy] mgr/alerts: Add Message-Id and Date header to sent emails (`pr#46311 <https://github.com/ceph/ceph/pull/46311>`_, Lorenz Bausch)
* ceph-fuse: ignore fuse mount failure if path is already mounted (`pr#45939 <https://github.com/ceph/ceph/pull/45939>`_, Nikhilkumar Shelke)
* ceph.in: clarify the usage of `--format` in the ceph command (`pr#46246 <https://github.com/ceph/ceph/pull/46246>`_, Laura Flores)
* ceph.spec.in: disable annobin plugin if compile with gcc-toolset (`pr#46377 <https://github.com/ceph/ceph/pull/46377>`_, Kefu Chai)
* ceph.spec.in: remove build directory at end of %install (`pr#45697 <https://github.com/ceph/ceph/pull/45697>`_, Tim Serong)
* ceph.spec.in: Use libthrift-devel on SUSE distros (`pr#45700 <https://github.com/ceph/ceph/pull/45700>`_, Tim Serong)
* ceph.spec: make ninja-build package install always (`pr#45875 <https://github.com/ceph/ceph/pull/45875>`_, Deepika Upadhyay)
* Cephadm Batch Backport April (`pr#46055 <https://github.com/ceph/ceph/pull/46055>`_, Adam King, Lukas Mayer, Ken Dreyer, Redouane Kachach, Aashish Sharma, Avan Thakkar, Moritz Röhrich, Teoman ONAY, Melissa Li, Christoph Glaubitz, Guillaume Abrioux, wangyunqing, Joseph Sawaya, Matan Breizman, Pere Diaz Bou, Michael Fritch, Patrick C. F. Ernzer)
* Cephadm Batch Backport May (`pr#46360 <https://github.com/ceph/ceph/pull/46360>`_, John Mulligan, Adam King, Prashant D, Redouane Kachach, Aashish Sharma, Ramana Raja, Ville Ojamo)
* cephadm: infer the default container image during pull (`pr#45568 <https://github.com/ceph/ceph/pull/45568>`_, Michael Fritch)
* cephadm: preserve `authorized_keys` file during upgrade (`pr#45359 <https://github.com/ceph/ceph/pull/45359>`_, Michael Fritch)
* cephadm: prometheus: The generatorURL in alerts is only using hostname (`pr#46353 <https://github.com/ceph/ceph/pull/46353>`_, Volker Theile)
* cephfs-shell: fix put and get cmd (`pr#46300 <https://github.com/ceph/ceph/pull/46300>`_, Dhairya Parmar, dparmar18)
* cephfs-top: Multiple filesystem support (`pr#46147 <https://github.com/ceph/ceph/pull/46147>`_, Neeraj Pratap Singh)
* client: add option to disable collecting and sending metrics (`pr#46476 <https://github.com/ceph/ceph/pull/46476>`_, Xiubo Li)
* cls/rgw: rgw_dir_suggest_changes detects race with completion (`pr#45901 <https://github.com/ceph/ceph/pull/45901>`_, Casey Bodley)
* cmake/modules: always use the python3 specified in command line (`pr#45966 <https://github.com/ceph/ceph/pull/45966>`_, Kefu Chai)
* cmake/rgw: add missing dependency on Arrow::Arrow (`pr#46144 <https://github.com/ceph/ceph/pull/46144>`_, Casey Bodley)
* cmake: resurrect mutex debugging in all Debug builds (`pr#45913 <https://github.com/ceph/ceph/pull/45913>`_, Ilya Dryomov)
* cmake: WITH_SYSTEM_UTF8PROC defaults to OFF (`pr#45766 <https://github.com/ceph/ceph/pull/45766>`_, Casey Bodley)
* CODEOWNERS: add RBD team (`pr#46542 <https://github.com/ceph/ceph/pull/46542>`_, Ilya Dryomov)
* debian: include the new object_format.py file (`pr#46409 <https://github.com/ceph/ceph/pull/46409>`_, John Mulligan)
* doc/cephfs/add-remove-mds: added cephadm note, refined "Adding an MDS" (`pr#45879 <https://github.com/ceph/ceph/pull/45879>`_, Dhairya Parmar)
* doc/dev: update basic-workflow.rst (`pr#46287 <https://github.com/ceph/ceph/pull/46287>`_, Zac Dover)
* doc/mgr/dashboard: Fix typo and double slash missing from URL (`pr#46075 <https://github.com/ceph/ceph/pull/46075>`_, Ville Ojamo)
* doc/start: add testing support information (`pr#45988 <https://github.com/ceph/ceph/pull/45988>`_, Zac Dover)
* doc/start: s/3/three/ in intro.rst (`pr#46325 <https://github.com/ceph/ceph/pull/46325>`_, Zac Dover)
* doc/start: update "memory" in hardware-recs.rst (`pr#46449 <https://github.com/ceph/ceph/pull/46449>`_, Zac Dover)
* Implement CIDR blocklisting (`pr#46469 <https://github.com/ceph/ceph/pull/46469>`_, Jos Collin, Greg Farnum)
* librbd/cache/pwl: fix bit field endianness issue (`pr#46094 <https://github.com/ceph/ceph/pull/46094>`_, Yin Congmin)
* mds: add a perf counter to record slow replies (`pr#46156 <https://github.com/ceph/ceph/pull/46156>`_, haoyixing)
* mds: include encoded stray inode when sending dentry unlink message to replicas (`issue#54046 <http://tracker.ceph.com/issues/54046>`_, `pr#46184 <https://github.com/ceph/ceph/pull/46184>`_, Venky Shankar)
* mds: reset heartbeat when fetching or committing entries (`pr#46181 <https://github.com/ceph/ceph/pull/46181>`_, Xiubo Li)
* mds: trigger to flush the mdlog in handle_find_ino() (`pr#46497 <https://github.com/ceph/ceph/pull/46497>`_, Xiubo Li)
* mgr/cephadm: Adding python natsort module (`pr#46065 <https://github.com/ceph/ceph/pull/46065>`_, Redouane Kachach)
* mgr/cephadm: try to get FQDN for configuration files (`pr#45665 <https://github.com/ceph/ceph/pull/45665>`_, Tatjana Dehler)
* mgr/dashboard:  don't log 3xx as errors (`pr#46453 <https://github.com/ceph/ceph/pull/46453>`_, Ernesto Puerta)
* mgr/dashboard: Compare values of MTU alert by device (`pr#45814 <https://github.com/ceph/ceph/pull/45814>`_, Aashish Sharma, Patrick Seidensal)
* mgr/dashboard: Creating and editing Prometheus AlertManager silences is buggy (`pr#46278 <https://github.com/ceph/ceph/pull/46278>`_, Volker Theile)
* mgr/dashboard: customizable log-in page text/banner (`pr#46342 <https://github.com/ceph/ceph/pull/46342>`_, Sarthak0702)
* mgr/dashboard: datatable in Cluster Host page hides wrong column on selection (`pr#45862 <https://github.com/ceph/ceph/pull/45862>`_, Sarthak0702)
* mgr/dashboard: extend daemon actions to host details (`pr#45722 <https://github.com/ceph/ceph/pull/45722>`_, Aashish Sharma, Nizamudeen A)
* mgr/dashboard: fix columns in host table  with NaN Undefined (`pr#46446 <https://github.com/ceph/ceph/pull/46446>`_, Avan Thakkar)
* mgr/dashboard: fix ssl cert validation for ingress service creation (`pr#46203 <https://github.com/ceph/ceph/pull/46203>`_, Avan Thakkar)
* mgr/dashboard: fix wrong pg status processing (`pr#46229 <https://github.com/ceph/ceph/pull/46229>`_, Ernesto Puerta)
* mgr/dashboard: form field validation icons overlap with other icons (`pr#46380 <https://github.com/ceph/ceph/pull/46380>`_, Sarthak0702)
* mgr/dashboard: highlight the search text in cluster logs (`pr#45679 <https://github.com/ceph/ceph/pull/45679>`_, Sarthak0702)
* mgr/dashboard: Imrove error message of '/api/grafana/validation' API endpoint (`pr#45957 <https://github.com/ceph/ceph/pull/45957>`_, Volker Theile)
* mgr/dashboard: introduce memory and cpu usage for daemons (`pr#46220 <https://github.com/ceph/ceph/pull/46220>`_, Aashish Sharma, Avan Thakkar)
* mgr/dashboard: Language dropdown box is partly hidden on login page (`pr#45619 <https://github.com/ceph/ceph/pull/45619>`_, Volker Theile)
* mgr/dashboard: RGW users and buckets tables are empty if the selected gateway is down (`pr#45867 <https://github.com/ceph/ceph/pull/45867>`_, Volker Theile)
* mgr/dashboard: Table columns hiding fix (`issue#51119 <http://tracker.ceph.com/issues/51119>`_, `pr#45724 <https://github.com/ceph/ceph/pull/45724>`_, Daniel Persson)
* mgr/dashboard: unselect rows in datatables (`pr#46323 <https://github.com/ceph/ceph/pull/46323>`_, Sarthak0702)
* mgr/dashboard: WDC multipath bug fixes (`pr#46455 <https://github.com/ceph/ceph/pull/46455>`_, Nizamudeen A)
* mgr/stats: be resilient to offline MDS rank-0 (`pr#45291 <https://github.com/ceph/ceph/pull/45291>`_, Jos Collin)
* mgr/telemetry: add Rook data (`pr#46486 <https://github.com/ceph/ceph/pull/46486>`_, Yaarit Hatuka)
* mgr/volumes: Fix idempotent subvolume rm (`pr#46140 <https://github.com/ceph/ceph/pull/46140>`_, Kotresh HR)
* mgr/volumes: set, get, list and remove metadata of snapshot (`pr#46508 <https://github.com/ceph/ceph/pull/46508>`_, Nikhilkumar Shelke)
* mgr/volumes: set, get, list and remove metadata of subvolume (`pr#45994 <https://github.com/ceph/ceph/pull/45994>`_, Nikhilkumar Shelke)
* mgr/volumes: Show clone failure reason in clone status command (`pr#45927 <https://github.com/ceph/ceph/pull/45927>`_, Kotresh HR)
* mon/LogMonitor: reopen log files on SIGHUP (`pr#46374 <https://github.com/ceph/ceph/pull/46374>`_, 胡玮文)
* mon/OSDMonitor: properly set last_force_op_resend in stretch mode (`pr#45871 <https://github.com/ceph/ceph/pull/45871>`_, Ilya Dryomov)
* mount/conf: Fix IPv6 parsing (`pr#46113 <https://github.com/ceph/ceph/pull/46113>`_, Matan Breizman)
* os/bluestore: set upper and lower bounds on rocksdb omap iterators (`pr#46175 <https://github.com/ceph/ceph/pull/46175>`_, Adam Kupczyk, Cory Snyder)
* os/bluestore: turn `bluestore zero block detection` off by default (`pr#46468 <https://github.com/ceph/ceph/pull/46468>`_, Laura Flores)
* osd/PGLog.cc: Trim duplicates by number of entries (`pr#46251 <https://github.com/ceph/ceph/pull/46251>`_, Nitzan Mordechai)
* osd/scrub: ignoring unsolicited DigestUpdate events (`pr#45595 <https://github.com/ceph/ceph/pull/45595>`_, Ronen Friedman)
* osd/scrub: restart snap trimming after a failed scrub (`pr#46418 <https://github.com/ceph/ceph/pull/46418>`_, Ronen Friedman)
* osd: return appropriate error if the object is not manifest (`pr#46061 <https://github.com/ceph/ceph/pull/46061>`_, Myoungwon Oh)
* qa/suites/rados/thrash-erasure-code-big/thrashers: add `osd max backfills` setting to mapgap and pggrow (`pr#46384 <https://github.com/ceph/ceph/pull/46384>`_, Laura Flores)
* qa/tasks/cephadm_cases: increase timeouts in test_cli.py (`pr#45625 <https://github.com/ceph/ceph/pull/45625>`_, Adam King)
* qa: add filesystem/file sync stuck test support (`pr#46496 <https://github.com/ceph/ceph/pull/46496>`_, Xiubo Li)
* qa: fix teuthology master branch ref (`pr#46503 <https://github.com/ceph/ceph/pull/46503>`_, Ernesto Puerta)
* qa: remove .teuthology_branch file (`pr#46491 <https://github.com/ceph/ceph/pull/46491>`_, Jeff Layton)
* Quincy: client: stop forwarding the request when exceeding 256 times (`pr#46178 <https://github.com/ceph/ceph/pull/46178>`_, Xiubo Li)
* Quincy: Wip doc backport quincy release notes to quincy branch 2022 05 24 (`pr#46381 <https://github.com/ceph/ceph/pull/46381>`_, Neha Ojha, David Galloway, Josh Durgin, Ilya Dryomov, Ernesto Puerta, Sridhar Seshasayee, Zac Dover, Yaarit Hatuka)
* rbd persistent cache UX improvements (status report, metrics, flush command) (`pr#45896 <https://github.com/ceph/ceph/pull/45896>`_, Ilya Dryomov, Yin Congmin)
* rgw: OpsLogFile::stop() signals under mutex (`pr#46038 <https://github.com/ceph/ceph/pull/46038>`_, Casey Bodley)
* rgw: remove rgw_rados_pool_pg_num_min and its use on pool creation use the cluster defaults for pg_num_min (`pr#46234 <https://github.com/ceph/ceph/pull/46234>`_, Casey Bodley)
* rgw: RGWCoroutine::set_sleeping() checks for null stack (`pr#46041 <https://github.com/ceph/ceph/pull/46041>`_, Or Friedmann, Casey Bodley)
* rgw_reshard: drop olh entries with empty name (`pr#45846 <https://github.com/ceph/ceph/pull/45846>`_, Dan van der Ster)
* rocksdb: build with rocksdb-7.y.z (`pr#46492 <https://github.com/ceph/ceph/pull/46492>`_, Kaleb S. KEITHLEY)
* rpm: use system libpmem on Centos 9 Stream (`pr#46212 <https://github.com/ceph/ceph/pull/46212>`_, Ilya Dryomov)
* run-make-check.sh: enable RBD persistent caches (`pr#45992 <https://github.com/ceph/ceph/pull/45992>`_, Ilya Dryomov)
* test/rbd_mirror: grab timer lock before calling add_event_after() (`pr#45905 <https://github.com/ceph/ceph/pull/45905>`_, Ilya Dryomov)
* test: fix TierFlushDuringFlush to wait until dedup_tier is set on base pool (`issue#53855 <http://tracker.ceph.com/issues/53855>`_, `pr#45624 <https://github.com/ceph/ceph/pull/45624>`_, Sungmin Lee)
* test: No direct use of nose (`pr#46254 <https://github.com/ceph/ceph/pull/46254>`_, Steve Kowalik)
* Wip doc pr 46109 backport to quincy (`pr#46116 <https://github.com/ceph/ceph/pull/46116>`_, Ville Ojamo)

v17.2.0 Quincy
==============

This is the first stable release of Ceph Quincy.

Major Changes from Pacific
--------------------------

General
~~~~~~~

* Filestore has been deprecated in Quincy. BlueStore is Ceph's default object
  store.

* The `ceph-mgr-modules-core` debian package no longer recommends
  `ceph-mgr-rook`. `ceph-mgr-rook` depends on `python3-numpy`, which
  cannot be imported in different Python sub-interpreters multiple times
  when the version of `python3-numpy` is older than 1.19. Because
  `apt-get` installs the `Recommends` packages by default, `ceph-mgr-rook`
  was always installed along with the `ceph-mgr` debian package as an
  indirect dependency. If your workflow depends on this behavior, you
  might want to install `ceph-mgr-rook` separately.

* The ``device_health_metrics`` pool has been renamed ``.mgr``. It is now
  used as a common store for all ``ceph-mgr`` modules. After upgrading to
  Quincy, the ``device_health_metrics`` pool will be renamed to ``.mgr``
  on existing clusters.

* The ``ceph pg dump`` command now prints three additional columns:
  `LAST_SCRUB_DURATION` shows the duration (in seconds) of the last completed
  scrub;
  `SCRUB_SCHEDULING` conveys whether a PG is scheduled to be scrubbed at a
  specified time, whether it is queued for scrubbing, or whether it is being
  scrubbed;
  `OBJECTS_SCRUBBED` shows the number of objects scrubbed in a PG after a
  scrub begins.

* A health warning is now reported if the ``require-osd-release`` flag
  is not set to the appropriate release after a cluster upgrade.

* LevelDB support has been removed. ``WITH_LEVELDB`` is no longer a supported
  build option. Users *should* migrate their monitors and OSDs to RocksDB
  before upgrading to Quincy.

* Cephadm: ``osd_memory_target_autotune`` is enabled by default, which sets
  ``mgr/cephadm/autotune_memory_target_ratio`` to ``0.7`` of total RAM. This
  is unsuitable for hyperconverged infrastructures. For hyperconverged Ceph,
  please refer to the documentation or set
  ``mgr/cephadm/autotune_memory_target_ratio`` to ``0.2``.

* telemetry: Improved the opt-in flow so that users can keep sharing the same
  data, even when new data collections are available. A new 'perf' channel that
  collects various performance metrics is now available for operators to opt
  into with:
  `ceph telemetry on`
  `ceph telemetry enable channel perf`
  See a sample report with `ceph telemetry preview`.
  Note that generating a telemetry report with 'perf' channel data might
  take a few moments in big clusters.
  For more details, see:
  https://docs.ceph.com/en/quincy/mgr/telemetry/

* MGR: The progress module disables the pg recovery event by default since the
  event is expensive and has interrupted other services when there are OSDs
  being marked in/out from the cluster. However, the user can still enable
  this event anytime. For more detail, see:

  https://docs.ceph.com/en/quincy/mgr/progress/

* https://tracker.ceph.com/issues/55383 is a known issue -
  to continue to log cluster log messages to file,
  run `ceph config set mon mon_cluster_log_to_file true` after every log rotation.

Cephadm
-------

* SNMP Support
* Colocation of Daemons (mgr, mds, rgw)
* osd memory autotuning
* Integration with new NFS mgr module
* Ability to zap osds as they are removed
* cephadm agent for increased performance/scalability

Dashboard
~~~~~~~~~
* Day 1: the new "Cluster Expansion Wizard" will guide users through post-install steps:
  adding new hosts, storage devices or services.
* NFS: the Dashboard now allows users to fully manage all NFS exports from a single place.
* New mgr module (feedback): users can quickly report Ceph tracker issues
  or suggestions directly from the Dashboard or the CLI.
* New "Message of the Day": cluster admins can publish a custom message in a banner.
* Cephadm integration improvements:
   * Host management: maintenance, specs and labelling,
   * Service management: edit and display logs,
   * Daemon management (start, stop, restart, reload),
   * New services supported: ingress (HAProxy) and SNMP-gateway.
* Monitoring and alerting:
   * 43 new alerts have been added (totalling 68) improving observability of events affecting:
     cluster health, monitors, storage devices, PGs and CephFS.
   * Alerts can now be sent externally as SNMP traps via the new SNMP gateway service
     (the MIB is provided).
   * Improved integrated full/nearfull event notifications.
   * Grafana Dashboards now use grafonnet format (though they're still available
     in JSON format).
   * Stack update: images for monitoring containers have been updated.
     Grafana 8.3.5, Prometheus 2.33.4, Alertmanager 0.23.0 and Node Exporter 1.3.1.
     This reduced exposure to several Grafana vulnerabilities (CVE-2021-43798,
     CVE-2021-39226, CVE-2021-43798,  CVE-2020-29510, CVE-2020-29511).

RADOS
~~~~~

* OSD: Ceph now uses `mclock_scheduler` for BlueStore OSDs as its default
  `osd_op_queue` to provide QoS. The 'mclock_scheduler' is not supported
  for Filestore OSDs. Therefore, the default 'osd_op_queue' is set to `wpq`
  for Filestore OSDs and is enforced even if the user attempts to change it.
  For more details on configuring mclock see,

  https://docs.ceph.com/en/quincy/rados/configuration/mclock-config-ref/

  An outstanding issue exists during runtime where the mclock config options
  related to reservation, weight and limit cannot be modified after switching
  to the `custom` mclock profile using the `ceph config set ...` command.
  This is tracked by: https://tracker.ceph.com/issues/55153. Until the issue
  is fixed, users are advised to avoid using the 'custom' profile or use the
  workaround mentioned in the tracker.

* MGR: The pg_autoscaler can now be turned `on` and `off` globally
  with the `noautoscale` flag. By default, it is set to `on`, but this flag
  can come in handy to prevent rebalancing triggered by autoscaling during
  cluster upgrade and maintenance. Pools can now be created with the `--bulk`
  flag, which allows the autoscaler to allocate more PGs to such pools. This
  can be useful to get better out of the box performance for data-heavy pools.

  For more details about autoscaling, see:
  https://docs.ceph.com/en/quincy/rados/operations/placement-groups/

* OSD: Support for on-wire compression for osd-osd communication, `off` by
  default.

  For more details about compression modes, see:
  https://docs.ceph.com/en/quincy/rados/configuration/msgr2/#compression-modes

* OSD: Concise reporting of slow operations in the cluster log. The old
  and more verbose logging behavior can be regained by setting
  `osd_aggregated_slow_ops_logging` to false.

* the "kvs" Ceph object class is not packaged anymore. The "kvs" Ceph
  object class offers a distributed flat b-tree key-value store that
  is implemented on top of the librados objects omap. Because there
  are no existing internal users of this object class, it is not
  packaged anymore.

RBD block storage
~~~~~~~~~~~~~~~~~

* rbd-nbd: `rbd device attach` and `rbd device detach` commands added,
  these allow for safe reattach after `rbd-nbd` daemon is restarted since
  Linux kernel 5.14.

* rbd-nbd: `notrim` map option added to support thick-provisioned images,
  similar to krbd.

* Large stabilization effort for client-side persistent caching on SSD
  devices, also available in 16.2.8. For details on usage, see:

  https://docs.ceph.com/en/quincy/rbd/rbd-persistent-write-log-cache/

* Several bug fixes in diff calculation when using fast-diff image
  feature + whole object (inexact) mode. In some rare cases these
  long-standing issues could cause an incorrect `rbd export`. Also
  fixed in 15.2.16 and 16.2.8.

* Fix for a potential performance degradation when running Windows VMs
  on krbd. For details, see `rxbounce` map option description:

  https://docs.ceph.com/en/quincy/man/8/rbd/#kernel-rbd-krbd-options

RGW object storage
~~~~~~~~~~~~~~~~~~

* RGW now supports rate limiting by user and/or by bucket. With this
  feature it is possible to limit user and/or bucket, the total operations
  and/or bytes per minute can be delivered. This feature allows the
  admin to limit only READ operations and/or WRITE operations. The
  rate-limiting configuration could be applied on all users and all buckets
  by using global configuration.

* `radosgw-admin realm delete` has been renamed to `radosgw-admin realm
  rm`. This is consistent with the help message.

* S3 bucket notification events now contain an `eTag` key instead of
  `etag`, and eventName values no longer carry the `s3:` prefix, fixing
  deviations from the message format that is observed on AWS.

* It is possible to specify ssl options and ciphers for beast frontend
  now. The default ssl options setting is
  "no_sslv2:no_sslv3:no_tlsv1:no_tlsv1_1". If you want to return to the old
  behavior, add 'ssl_options=' (empty) to the ``rgw frontends`` configuration.

* The behavior for Multipart Upload was modified so that only
  CompleteMultipartUpload notification is sent at the end of the multipart
  upload. The POST notification at the beginning of the upload and the PUT
  notifications that were sent on each part are no longer sent.


CephFS distributed file system
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* fs: A file system can be created with a specific ID ("fscid"). This is
  useful in certain recovery scenarios (for example, when a monitor
  database has been lost and rebuilt, and the restored file system is
  expected to have the same ID as before).

* fs: A file system can be renamed using the `fs rename` command. Any cephx
  credentials authorized for the old file system name will need to be
  reauthorized to the new file system name. Since the operations of the clients
  using these re-authorized IDs may be disrupted, this command requires the
  "--yes-i-really-mean-it" flag. Also, mirroring is expected to be disabled
  on the file system.

* MDS upgrades no longer require all standby MDS daemons to be stoped before
  upgrading a file systems's sole active MDS.

* CephFS: Failure to replay the journal by a standby-replay daemon now
  causes the rank to be marked "damaged".

Upgrading from Octopus or Pacific
----------------------------------

Quincy does not support LevelDB. Please migrate your OSDs and monitors
to RocksDB before upgrading to Quincy.

Before starting, make sure your cluster is stable and healthy (no down or
recovering OSDs).  (This is optional, but recommended.) You can disable
the autoscaler for all pools during the upgrade using the noautoscale flag.

.. note::

  You can monitor the progress of your upgrade at each stage with the
  ``ceph versions`` command, which will tell you what ceph version(s) are
  running for each type of daemon.

Upgrading cephadm clusters
~~~~~~~~~~~~~~~~~~~~~~~~~~

If your cluster is deployed with cephadm (first introduced in Octopus), then
the upgrade process is entirely automated.  To initiate the upgrade,

  .. prompt:: bash #

    ceph orch upgrade start --ceph-version 17.2.0

The same process is used to upgrade to future minor releases.

Upgrade progress can be monitored with ``ceph -s`` (which provides a simple
progress bar) or more verbosely with

  .. prompt:: bash #

    ceph -W cephadm

The upgrade can be paused or resumed with

  .. prompt:: bash #

    ceph orch upgrade pause   # to pause
    ceph orch upgrade resume  # to resume

or canceled with

  .. prompt:: bash #

    ceph orch upgrade stop

Note that canceling the upgrade simply stops the process; there is no ability to
downgrade back to Octopus or Pacific.


Upgrading non-cephadm clusters
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. note::
   If you cluster is running Octopus (15.2.x) or later, you might choose
   to first convert it to use cephadm so that the upgrade to Quincy
   is automated (see above).  For more information, see
   :ref:`cephadm-adoption`.

#. Set the ``noout`` flag for the duration of the upgrade. (Optional,
   but recommended.)::

     # ceph osd set noout

#. Upgrade monitors by installing the new packages and restarting the
   monitor daemons.  For example, on each monitor host,::

     # systemctl restart ceph-mon.target

   Once all monitors are up, verify that the monitor upgrade is
   complete by looking for the ``quincy`` string in the mon
   map.  The command::

     # ceph mon dump | grep min_mon_release

   should report::

     min_mon_release 17 (quincy)

   If it doesn't, that implies that one or more monitors hasn't been
   upgraded and restarted and/or the quorum does not include all monitors.

#. Upgrade ``ceph-mgr`` daemons by installing the new packages and
   restarting all manager daemons.  For example, on each manager host,::

     # systemctl restart ceph-mgr.target

   Verify the ``ceph-mgr`` daemons are running by checking ``ceph
   -s``::

     # ceph -s

     ...
       services:
        mon: 3 daemons, quorum foo,bar,baz
        mgr: foo(active), standbys: bar, baz
     ...

#. Upgrade all OSDs by installing the new packages and restarting the
   ceph-osd daemons on all OSD hosts::

     # systemctl restart ceph-osd.target

#. Upgrade all CephFS MDS daemons. For each CephFS file system,

   #. Disable standby_replay::

	# ceph fs set <fs_name> allow_standby_replay false

   #. Reduce the number of ranks to 1.  (Make note of the original
      number of MDS daemons first if you plan to restore it later.)::

	# ceph status
	# ceph fs set <fs_name> max_mds 1

   #. Wait for the cluster to deactivate any non-zero ranks by
      periodically checking the status::

	# ceph status

   #. Take all standby MDS daemons offline on the appropriate hosts with::

	# systemctl stop ceph-mds@<daemon_name>

   #. Confirm that only one MDS is online and is rank 0 for your FS::

	# ceph status

   #. Upgrade the last remaining MDS daemon by installing the new
      packages and restarting the daemon::

        # systemctl restart ceph-mds.target

   #. Restart all standby MDS daemons that were taken offline::

	# systemctl start ceph-mds.target

   #. Restore the original value of ``max_mds`` for the volume::

	# ceph fs set <fs_name> max_mds <original_max_mds>

#. Upgrade all radosgw daemons by upgrading packages and restarting
   daemons on all hosts::

     # systemctl restart ceph-radosgw.target

#. Complete the upgrade by disallowing pre-Quincy OSDs and enabling
   all new Quincy-only functionality::

     # ceph osd require-osd-release quincy

#. If you set ``noout`` at the beginning, be sure to clear it with::

     # ceph osd unset noout

#. Consider transitioning your cluster to use the cephadm deployment
   and orchestration framework to simplify cluster management and
   future upgrades.  For more information on converting an existing
   cluster to cephadm, see :ref:`cephadm-adoption`.

Post-upgrade
~~~~~~~~~~~~

#. Verify the cluster is healthy with ``ceph health``. If your cluster is
   running Filestore, a deprecation warning is expected. This warning can
   be temporarily muted using the following command::

     ceph health mute OSD_FILESTORE

#. If you are upgrading from Mimic, or did not already do so when you
   upgraded to Nautilus, we recommend you enable the new :ref:`v2
   network protocol <msgr2>`, issue the following command::

     ceph mon enable-msgr2

   This will instruct all monitors that bind to the old default port
   6789 for the legacy v1 protocol to also bind to the new 3300 v2
   protocol port.  To see if all monitors have been updated,::

     ceph mon dump

   and verify that each monitor has both a ``v2:`` and ``v1:`` address
   listed.

#. Consider enabling the :ref:`telemetry module <telemetry>` to send
   anonymized usage statistics and crash information to the Ceph
   upstream developers.  To see what would be reported (without actually
   sending any information to anyone),::

     ceph telemetry preview-all

   If you are comfortable with the data that is reported, you can opt-in to
   automatically report the high-level cluster metadata with::

     ceph telemetry on

   The public dashboard that aggregates Ceph telemetry can be found at
   `https://telemetry-public.ceph.com/ <https://telemetry-public.ceph.com/>`_.

   For more information about the telemetry module, see :ref:`the
   documentation <telemetry>`.


Upgrading from pre-Octopus releases (like Nautilus)
---------------------------------------------------


You *must* first upgrade to Octopus (15.2.z) or Pacific (16.2.z) before
upgrading to Quincy.
