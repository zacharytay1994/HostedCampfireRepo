using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Campfire.ActivityDesc
{
    public class Activity
    {
        private string title { get; set; }
        private string desc { get; set; }
        private string links { get; set; }
        private string expl { get; set; }
        private int upVotes { get; set; }
        private int downVotes { get; set; }
        //comments ?

        public Activity(string _title, string _desc, string _links, string _expl, int _upVotes, int _downVotes)
        {
            title = _title;
            desc = _desc;
            links = _links;
            expl = _expl;
            upVotes = _upVotes;
            downVotes = _downVotes;
        }

        public void fillTables()
        {

        }
    }
}