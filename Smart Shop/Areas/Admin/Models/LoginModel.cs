using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Smart_Shop.Areas.Admin.Models
{
    public class LoginModel
    {
        
        [Required(ErrorMessage = "Bạn chưa nhập tên tài khoản")]
        public string UserName { get; set; }
        [Required(ErrorMessage = "Bạn chưa nhập mật khẩu")]
        
        public string PassWord { get; set; }
        //public bool RememberMe { get; set; }

        //public int UserId { get; set; }
    }
}