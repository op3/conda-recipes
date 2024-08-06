#!/usr/bin/env sh
for dir in structure samples doc misc; do
  find $dir -type f -exec install -Dm 644 "{}" "${PREFIX}/share/talys/{}" \;
done

# Add the post activate/deactivate scripts
for action in activate deactivate; do
  mkdir -p "${PREFIX}/etc/conda/${action}.d"
  for suffix in sh csh fish; do
    cp "${RECIPE_DIR}/${action}.sh" "${PREFIX}/etc/conda/${action}.d/${action}-talys.${suffix}"
  done
done
