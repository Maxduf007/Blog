using System;
using System.Collections.Generic;

namespace Blog.Models
{
    public partial class Comment
    {
        public Comment()
        {
            InverseCommentParent = new HashSet<Comment>();
        }

        public Guid Id { get; set; }
        public string? Text { get; set; }
        public Guid? CommentParentId { get; set; }
        public Guid PostId { get; set; }
        public Guid UserId { get; set; }
        public DateTime? CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }

        public virtual Comment? CommentParent { get; set; }
        public virtual Post Post { get; set; } = null!;
        public virtual User User { get; set; } = null!;
        public virtual ICollection<Comment> InverseCommentParent { get; set; }
    }
}
