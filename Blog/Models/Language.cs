using System;
using System.Collections.Generic;

namespace Blog.Models
{
    public partial class Language
    {
        public Language()
        {
            Users = new HashSet<User>();
        }

        public Guid Id { get; set; }
        public string Name { get; set; } = null!;
        public string Abbreviation { get; set; } = null!;

        public virtual ICollection<User> Users { get; set; }
    }
}
