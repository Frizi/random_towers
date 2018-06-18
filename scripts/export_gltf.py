import os
import bpy

outfile = os.getenv("BLENDER_EXPORTER_OUTPUT_FILE")
print("outfile: ", outfile)
bpy.ops.export_scene.gltf(
    # export_layers=True,
    # export_normals=True,
    export_morph=False,
    # export_indices='UNSIGNED_INT',
    # export_embed_images=False,
    # will_save_settings=False,
    # export_selected=False,
    # export_colors=True,
    # export_camera_infinite=False,
    # export_lights=False,
    # export_extras=False,
    # export_strip=False,
    # export_frame_range=True,
    # export_bake_skins=False,
    # export_skins=True,
    # export_yup=True,
    # export_copyright="",
    # export_morph_normal=True,
    # export_tangents=True,
    # export_cameras=False,
    # export_apply=False,
    # export_animations=True,
    # export_texcoords=True,
    # export_force_indices=False,
    # export_force_sampling=False,
    # export_materials=True,
    # export_morph_tangent=True,
    # export_move_keyframes=True,
    # export_current_frame=True,
    # export_embed_buffers=False,
    # export_displacement=False,
    filepath=outfile,
    check_existing=False
    # filter_glob="*.gltf"
)
