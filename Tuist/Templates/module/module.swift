import ProjectDescription

let name: Template.Attribute = .required("name")
let example: Template.Attribute = .optional("example", default: "false")

let template = Template(
    description: "Module",
    attributes: [
        name,
        example,
    ],
    items: [
        .file(path: "Projects/\(name)/Project.swift", templatePath: "project.stencil"),
        .file(path: "Projects/\(name)/Sources/\(name).swift", templatePath: "sources.stencil"),
        .file(path: "Projects/\(name)/Interface/\(name)Type.swift", templatePath: "interface.stencil"),
        .file(path: "Projects/\(name)/Testing/\(name)Mock.swift", templatePath: "testing.stencil"),
        .file(path: "Projects/\(name)/Tests/\(name)Tests.swift", templatePath: "tests.stencil"),
        .file(path: "Projects/\(name)/Resources/Assets.xcassets/Contents.json", templatePath: "contents_json.stencil"),
        .file(path: "Projects/\(name)/Example/Sources/\(name)ExampleApp.swift", templatePath: "example_app.stencil"),
        .file(path: "Projects/\(name)/Example/Sources/ContentView.swift", templatePath: "example_view.stencil"),
        .file(path: "Projects/\(name)/Example/Resources/Assets.xcassets/Contents.json", templatePath: "contents_json.stencil"),
    ]
)
