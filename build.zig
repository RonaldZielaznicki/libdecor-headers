const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addStaticLibrary(.{
        .name = "libdecor-headers",
        .root_source_file = b.addWriteFiles().add("empty.c", ""),
        .target = target,
        .optimize = optimize,
    });

    lib.installHeadersDirectory(b.path("include"), ".", .{});

    b.installArtifact(lib);
}
