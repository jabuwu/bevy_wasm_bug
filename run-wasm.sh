set -e
rm -rf wasm
cargo build --target wasm32-unknown-unknown --release
wasm-bindgen --no-typescript --out-name bug --out-dir wasm --target web target/wasm32-unknown-unknown/release/wasm-bug.wasm
cp static/* wasm/
(cd wasm && npx serve)
