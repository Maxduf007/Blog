using System;
using System.Collections.Generic;

namespace Blog.Models
{
    public partial class TopicsPost
    {
        public Guid TopicId { get; set; }
        public Guid PostId { get; set; }

        public virtual Post Post { get; set; } = null!;
        public virtual Topic Topic { get; set; } = null!;
    }
}
