pkg_origin=qubitrenegade
pkg_name=vault
pkg_version=0.10.0
pkg_description="A tool for managing secrets."
pkg_maintainer='The Habitat Maintainers <humans@habitat.sh>'
pkg_license=("MPL-2.0")
pkg_upstream_url=https://www.vaultproject.io/
pkg_source=https://releases.hashicorp.com/vault/${pkg_version}/vault_${pkg_version}_linux_amd64.zip
pkg_shasum=a6b4b6db132f3bbe6fbb77f76228ffa45bd55a5a1ab83ff043c2c665c3f5a744
pkg_filename=${pkg_name}-${pkg_version}_linux_amd64.zip
pkg_deps=()
pkg_build_deps=(core/unzip)
pkg_bin_dirs=(bin)
pkg_svc_user=root
pkg_svc_group=root
pkg_exports=(
  [port]=listener.port
)
pkg_exposes=(port)

pkg_bind_optional=(
  [consul-client]="address"
)

do_unpack() {
  cd "${HAB_CACHE_SRC_PATH}" || exit
  unzip ${pkg_filename} -d "${pkg_name}-${pkg_version}"
}

do_build() {
  return 0
}

do_install() {
  install -D vault "${pkg_prefix}"/bin/vault
}
