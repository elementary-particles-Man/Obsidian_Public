@startuml
' VoVPostオブジェクト構造（クラス図）
title VoVPost クラス図（署名・フラグ・断片構造）

class VoVPost {
  +UUID post_id
  +String vov_id
  +String nickname
  +DateTime timestamp
  +List<String> intent_flags
  +Signature signature
  +TextContent content
  +List<ImagePointer> images
  +List<VideoPointer> videos
  +List<Attachment> attachments
}

class Signature {
  +String type (PGP/ECC)
  +String hash
  +Boolean verified
}

class TextContent {
  +String original_text
  +List<TextFragment> fragments
}

class TextFragment {
  +String id
  +String hash
  +int size
  +int seq
}

class ImagePointer {
  +String original_name
  +String hash
  +String mime_type
  +int index
}

class VideoPointer {
  +String original_name
  +String hash
  +String mime_type
  +int index
}

class Attachment {
  +String original_name
  +String hash
  +String mime_type
  +int index
}

VoVPost --> Signature
VoVPost --> TextContent
TextContent --> TextFragment
VoVPost --> ImagePointer
VoVPost --> VideoPointer
VoVPost --> Attachment
@enduml
