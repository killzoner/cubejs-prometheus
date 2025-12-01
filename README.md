# Cubejs prometheus metrics

Docker image to expose Cubejs statsd metrics as prometheus metrics.

Currently, the metrics port uses a [`UdpSocket`](https://doc.rust-lang.org/std/net/struct.UdpSocket.html#method.bind) bind so the address needs to be a valid IP and you can't use DNS name (<https://github.com/cube-js/cube/blob/master/rust/cubestore/cubestore/src/util/metrics.rs#L138>), so this Docker image is an alternative to expose these metrics.
