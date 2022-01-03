package org.kosta.finalproject.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.kosta.finalproject.model.domain.UserVO;
import org.kosta.finalproject.model.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	@RequestMapping("guest/registerForm")
	public String registerForm() {
		return "user/registerForm";
		// return "/guest/registerForm";
	}

	@RequestMapping("guest/registerIdCheck")
	@ResponseBody
	public int registerIdCheck(String userId) {
		int count = userService.registerIdCheck(userId);
		return count;

	}

	@RequestMapping("guest/registerTelCheck")
	@ResponseBody
	public int registerTelCheck(String userTel) {
		int count = userService.registerTelCheck(userTel);
		return count;
	}

	// forward 값을 가지고 넘어갈때 redirect 값을 가지지 않고 넘어갈 때
	@PostMapping("guest/registerUser")
	public String register(UserVO userVO, HttpServletRequest request, @RequestParam("user_image") MultipartFile imgfile)
			throws IllegalStateException, IOException {
//		System.out.println(imgfile.getSize());
		String savedname=null;
		if(imgfile.getSize()>1) {
			savedname = userService.uploadSingleImage(userVO, request, imgfile);
		}
		userVO.setUserImage(savedname);
		userService.registerUser(userVO);

		return "user/register_result";
	}

	@RequestMapping("login_form")
	public String login() {
		// System.out.println("userContoller");
		return "user/login_form";
	}

	// 회원 Id 전화번호로 검색 findIdByTel폼으로 이동
	@RequestMapping("guest/findIdByTelForm")
	public String findIdByTelForm() {
		// System.out.println("findIdByTel경로 테스트");
		return "user/FindIdByTel-form";
	}

	@RequestMapping("guest/findIdByTel")
	@ResponseBody
	public String findIdByTel(String userTel) {
		String idResult = userService.findIdByTel(userTel);
		if (idResult != null) {
			return idResult;
		} else {
			return "존재하지 않는 아이디";
		}
	}

	@RequestMapping("login_fail")
	public String loginFail() {
		return "user/login_fail";
	}

	@RequestMapping("profile")
	public String profile() {
		return "user/profile.tiles";
	}

	@RequestMapping("soldItems")
	public String soldItems() {
		return "user/sold-items.tiles";
	}

	@RequestMapping("buyItems")
	public String buyItems() {
		return "user/buy-items.tiles";
	}

	@RequestMapping("bookmarks")
	public String bookmarks() {
		return "user/bookmarks.tiles";
	}

	@RequestMapping("profileUpdateForm")
	public String profileUpdateForm() {
		return "user/profile-updateForm.tiles";
	}

	@RequestMapping("passwordUpdateForm")
	public String passwordUpdateForm() {
		return "user/password-updateForm.tiles";
	}

	@RequestMapping("addressUpdateForm")
	public String addressUpdateForm() {
		return "user/address-updateForm.tiles";
	}

	@PostMapping("profileUpdate")
	public String profileUpdate(Authentication authentication, UserVO userVO, HttpServletRequest request,
			@RequestParam("update_user_image") MultipartFile imgfile) throws IllegalStateException, IOException {
		// System.out.println(userVO);
		UserVO uvo = (UserVO) authentication.getPrincipal(); // 현재 인증객체를 받아와 uvo 사용하기 위해 저장한다
		// 사용자의 수정정보를 받아와 DB에 업데이트한다(tel,mail만수정<<후에 Password까지 변환시 service계층에서 암호화처리추가)
		uvo.setUserTel(userVO.getUserTel()); // 업데이트 된 정보를 현재 인증객체에 저장해준다!
		uvo.setUserEmail(userVO.getUserEmail());
		userService.updateUserPartPET(userVO);

		if (imgfile.getSize()>1) {
//			System.out.println("img update");
			userService.updateUploadSingleImage(userVO, request, imgfile);
		}
		// userService.updateUserPartPET(userVO);
		return "user/update_result";
	}

	// 회원정보수정- 비밀번호를 입력하고 암호화하여 다시 db에 저장한다
	@PostMapping("PasswordUpdate")
	public String userPasswordUpdate(Authentication authentication, UserVO userVO) {
		UserVO uvo = (UserVO) authentication.getPrincipal();
		userService.updateUserPassword(userVO);
		uvo.setUserPassword(userVO.getUserPassword());

		return "user/update_result";
	}


	// 회원정보수정 - 현재위치를 받아와서 수정할 수 있도록 한다
	@PostMapping("profileAddressUpdate")
	public String profileAddressUpdate(Authentication authentication, UserVO userVO) {
		// System.out.println(userVO);
		UserVO uvo = (UserVO) authentication.getPrincipal(); // 현재 인증객체를 받아와 uvo 사용하기 위해 저장한다
		// 사용자의 수정정보를 받아와 DB에 업데이트한다(순수 수정>>후에 Password까지 변환시 service계층에서 암호화처리추가한다)
		userService.profileAddressUpdate(userVO);
		uvo.setUserAddress(userVO.getUserAddress());// 업데이트 된 정보를 현재 인증객체에 저장해준다!
//		System.out.println(userVO);
		return "user/update_result";
	}

	// 회원수정에서 비밀번호 비교!!!
	// if (!passwordEncoder.matches(password, member.getPassword()))
	// throw new BadCredentialsException("비밀번호가 일치하지 않습니다");

	// @RequestMapping("user/profile.tiles")
	// public String p
	/*
	 * @RequestMapping("guest/registerIdCheck")
	 * 
	 * @ResponseBody public int registerIdCheck(String userId) { int count
	 * =userMapper.registerIdCheck(userId); return count;
	 */
}
