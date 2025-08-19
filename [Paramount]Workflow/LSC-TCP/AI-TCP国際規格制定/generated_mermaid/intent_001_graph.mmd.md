```mermaid
graph TD
    id --> intent_001
    name --> test one
    components --> components_0
    components_0 --> id
    id --> source1
    components_0 --> name
    name --> InputTrigger
    components_0 --> type
    type --> source
    components --> components_1
    components_1 --> id
    id --> step1
    components_1 --> name
    name --> ProcessIntent
    components_1 --> type
    type --> process
    components --> components_2
    components_2 --> id
    id --> response1
    components_2 --> name
    name --> ReturnIntent
    components_2 --> type
    type --> response
    connections --> connections_0
    connections_0 --> from
    from --> source1
    connections_0 --> to
    to --> step1
    connections --> connections_1
    connections_1 --> from
    from --> step1
    connections_1 --> to
    to --> response1
```