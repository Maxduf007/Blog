using System;
using System.Collections.Generic;

namespace Blog.Models
{
    public partial class Topic
    {
        public Guid Id { get; set; }
        public string Name { get; set; } = null!;
    }
}
