[![ci](https://github.com/l0rd/cloud-dev-images/actions/workflows/main-branch-push.yaml/badge.svg)](https://github.com/l0rd/cloud-dev-images/actions/workflows/main-branch-push.yaml)

## Alpine based

[![Alpine based](https://img.shields.io/static/v1?label=alpine%20based&message=vscode&logo=eclipseche&color=FDB940&labelColor=525C86)](https://che-dogfooding.apps.che-dev.x6e0.p1.openshiftapps.com/#https://github.com/l0rd/cloud-dev-images?image=quay.io/mloriedo/cloud-dev-images:alpine&che-editor=che-incubator/che-code/insiders)

**Current status: vscode fails to start**

<details>
  <summary>vscode entrypoint logs</summary>

  ```
  total 4
  drwxrwsrwx    5 root     10011100       124 Apr 26 22:55 .
  dr-xr-xr-x    1 root     root           157 Apr 26 22:55 ..
  drwxr-sr-x    2 10011100 10011100        26 Apr 26 22:55 bin
  drwxr-sr-x    7 10011100 10011100       135 Apr 26 22:55 checode-linux-libc
  drwxr-sr-x    7 10011100 10011100       135 Apr 26 22:55 checode-linux-musl
  -rw-rw-rw-    1 10011100 10011100         0 Apr 26 22:55 entrypoint-logs.txt
  -rwxr-xr-x    1 10011100 10011100      2838 Apr 26 22:55 entrypoint-volume.sh
  time="2023-04-26T22:55:11Z" level=info msg="Default 'info' log level is applied"
  time="2023-04-26T22:55:11Z" level=info msg="Exec containers configuration:"
  time="2023-04-26T22:55:11Z" level=info msg="==> Debug level info"
  time="2023-04-26T22:55:11Z" level=info msg="==> Application url 0.0.0.0:3333"
  time="2023-04-26T22:55:11Z" level=info msg="==> Absolute path to folder with static resources "
  time="2023-04-26T22:55:11Z" level=info msg="==> Use bearer token: false"
  time="2023-04-26T22:55:11Z" level=info msg="==> Pod selector: controller.devfile.io/devworkspace_id=workspace3fb77ec8b0944e88"
  time="2023-04-26T22:55:11Z" level=info msg="==> Idle timeout: 3h0m0s"
  time="2023-04-26T22:55:11Z" level=info msg="==> Run timeout: 24h0m0s"
  time="2023-04-26T22:55:11Z" level=info msg="==> Stop retry period: 10s"
  [GIN-debug] [WARNING] Creating an Engine instance with the Logger and Recovery middleware already attached.

  [GIN-debug] [WARNING] Running in "debug" mode. Switch to "release" mode in production.
   - using env:   export GIN_MODE=release
   - using code:  gin.SetMode(gin.ReleaseMode)

  [GIN-debug] GET    /connect                  --> main.main.func2 (3 handlers)
  [GIN-debug] GET    /attach/:id               --> main.main.func3 (3 handlers)
  [GIN-debug] POST   /exec/config              --> main.main.func4 (3 handlers)
  [GIN-debug] POST   /exec/init                --> main.main.func5 (3 handlers)
  [GIN-debug] POST   /activity/tick            --> main.main.func6 (3 handlers)
  [GIN-debug] GET    /healthz                  --> main.main.func7 (3 handlers)
  ⇩ Registered RPCRoutes:

  Json-rpc MachineExec Routes:
  ✓ create
  ✓ check
  ✓ resize
  ✓ listContainers
  time="2023-04-26T22:55:11Z" level=info msg="Activity tracker is run and workspace will be stopped in 3h0m0s if there is no activity"
  time="2023-04-26T22:55:11Z" level=info msg="Run idle manager is running. The workspace will be stopped in 24h0m0s"
  [GIN-debug] Listening and serving HTTP on 0.0.0.0:3333
  using OPENVSX_URL=https://open-vsx.org/vscode
  Node.js dir for running VS Code: /checode/checode-linux-musl
  Error loading shared library libstdc++.so.6: No such file or directory (needed by /checode/checode-linux-musl/node)
  Error loading shared library libgcc_s.so.1: No such file or directory (needed by /checode/checode-linux-musl/node)
  Error relocating /checode/checode-linux-musl/node: _ZNSt7__cxx1119basic_ostringstreamIcSt11char_traitsIcESaIcEEC1Ev: symbol not found
  Error relocating /checode/checode-linux-musl/node: _ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9push_backEc: symbol not found
  Error relocating /checode/checode-linux-musl/node: _ZStrsIcSt11char_traitsIcESaIcEERSt13basic_istreamIT_T0_ES7_RNSt7__cxx1112basic_stringIS4_S5_T1_EE: symbol not found
  Error relocating /checode/checode-linux-musl/node: _ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6resizeEmc: symbol not found
  Error relocating /checode/checode-linux-musl/node: _ZSt18_Rb_tree_incrementPKSt18_Rb_tree_node_base: symbol not found
  Error relocating /checode/checode-linux-musl/node: _ZNSi10_M_extractIdEERSiRT_: symbol not found
  ...
  ```

</details>


## Busybox based

[![Busybox based](https://img.shields.io/static/v1?label=busybox%20based&message=vscode&logo=eclipseche&color=FDB940&labelColor=525C86)](https://che-dogfooding.apps.che-dev.x6e0.p1.openshiftapps.com/#https://github.com/l0rd/cloud-dev-images?image=quay.io/mloriedo/cloud-dev-images:busybox&che-editor=che-incubator/che-code/insiders)

**Current status: vscode fails to start**
```
```

## Docker based

[![Docker based](https://img.shields.io/static/v1?label=docker%20based&message=vscode&logo=eclipseche&color=FDB940&labelColor=525C86)](https://che-dogfooding.apps.che-dev.x6e0.p1.openshiftapps.com/#https://github.com/l0rd/cloud-dev-images?image=quay.io/mloriedo/cloud-dev-images:docker&che-editor=che-incubator/che-code/insiders)

**Current status: vscode fails to start**
```
```

## Fedora based

[![Fedora based](https://img.shields.io/static/v1?label=fedora%20based&message=vscode&logo=eclipseche&color=FDB940&labelColor=525C86)](https://che-dogfooding.apps.che-dev.x6e0.p1.openshiftapps.com/#https://github.com/l0rd/cloud-dev-images?image=quay.io/mloriedo/cloud-dev-images:fedora&che-editor=che-incubator/che-code/insiders)

**Current status: vscode fails to start**
```
```

## Golang based

[![Golang based](https://img.shields.io/static/v1?label=golang%20based&message=vscode&logo=eclipseche&color=FDB940&labelColor=525C86)](https://che-dogfooding.apps.che-dev.x6e0.p1.openshiftapps.com/#https://github.com/l0rd/cloud-dev-images?image=quay.io/mloriedo/cloud-dev-images:golang&che-editor=che-incubator/che-code/insiders)

**Current status: vscode fails to start**
```
```

## OpenJDK based

[![OpenJDK based](https://img.shields.io/static/v1?label=openjdk%20based&message=vscode&logo=eclipseche&color=FDB940&labelColor=525C86)](https://che-dogfooding.apps.che-dev.x6e0.p1.openshiftapps.com/#https://github.com/l0rd/cloud-dev-images?image=quay.io/mloriedo/cloud-dev-images:openjdk&che-editor=che-incubator/che-code/insiders)

**Current status: vscode fails to start**
```
```

## UBI8 based

[![UBI8 based](https://img.shields.io/static/v1?label=ubi8%20based&message=vscode&logo=eclipseche&color=FDB940&labelColor=525C86)](https://che-dogfooding.apps.che-dev.x6e0.p1.openshiftapps.com/#https://github.com/l0rd/cloud-dev-images?image=quay.io/mloriedo/cloud-dev-images:ubi8&che-editor=che-incubator/che-code/insiders)

**Current status: ✅**
```
```

## UBI9 based

[![UBI9 based](https://img.shields.io/static/v1?label=ubi9%20based&message=vscode&logo=eclipseche&color=FDB940&labelColor=525C86)](https://che-dogfooding.apps.che-dev.x6e0.p1.openshiftapps.com/#https://github.com/l0rd/cloud-dev-images?image=quay.io/mloriedo/cloud-dev-images:ubi9&che-editor=che-incubator/che-code/insiders)

**Current status: vscode fails to start**
```
```

## Ubuntu based

[![Ubuntu based](https://img.shields.io/static/v1?label=ubuntu%20based&message=vscode&logo=eclipseche&color=FDB940&labelColor=525C86)](https://che-dogfooding.apps.che-dev.x6e0.p1.openshiftapps.com/#https://github.com/l0rd/cloud-dev-images?image=quay.io/mloriedo/cloud-dev-images:ubuntu&che-editor=che-incubator/che-code/insiders)

**Current status: ✅**
