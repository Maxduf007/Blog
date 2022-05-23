using System;
using System.Collections.Generic;

namespace Blog.Models
{
    public partial class UsersPost
    {
        public Guid UserId { get; set; }
        public Guid PostId { get; set; }
        public bool IsContributor { get; set; }

        public virtual Post Post { get; set; } = null!;
        public virtual User User { get; set; } = null!;
    }
}
