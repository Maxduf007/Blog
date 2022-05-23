using System;
using System.Collections.Generic;

namespace Blog.Models
{
    public partial class Post
    {
        public Post()
        {
            Comments = new HashSet<Comment>();
        }

        public Guid Id { get; set; }
        public string Title { get; set; } = null!;
        public string MainContent { get; set; } = null!;
        public string Introduction { get; set; } = null!;
        public DateTime? PublishedAt { get; set; }
        public DateTime? CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public Guid? UserId { get; set; }

        public virtual User? User { get; set; }
        public virtual ICollection<Comment> Comments { get; set; }
    }
}
