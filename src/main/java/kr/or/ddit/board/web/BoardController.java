package kr.or.ddit.board.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.PaginationInfoVO;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Inject
	private IBoardService boardService;
	
	@RequestMapping(value = "/boardForm.do" , method= RequestMethod.GET)
	public String boardForm() {
		return "pages/ddit_form";
	}
	
	@RequestMapping(value = "/boardlist.do", method = RequestMethod.GET)
	public String boardlist(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,  //defaultValue 페이지 기본 디폴트 값
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			Model model) {
	
		//페이징 및 검색이 적용된 목록 조회(방법2)
		PaginationInfoVO<BoardVO> pagingVO = new PaginationInfoVO<BoardVO>();
		
		//브라우저에서 검색한 검색 유형, 검색 키워드를 이용하여 검색 처리
		//검색 키워드가 있으면 검색을 한거고, 키워드가 없으면 검색을 하지 않음
		if(StringUtils.isNoneBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		
		pagingVO.setCurrentPage(currentPage);
		// 목록 총 게시글 수 가져오기
		int totalRecord = boardService.selectBoardCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		List<BoardVO> dataList = boardService.selectBoardList(pagingVO);
		pagingVO.setDataList(dataList);
		model.addAttribute("pagingVO", pagingVO);
		
		return "pages/ddit_list";
	}
	
	@RequestMapping(value = "/detail.do", method=RequestMethod.GET)
	public String boardDetail(int boNo, Model model) {
		BoardVO boardVO = boardService.selectBoard(boNo);
		model.addAttribute("board", boardVO);
		return "pages/ddit_detail";
	}
	
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	public String boardInsert(BoardVO boardVO, Model model) {
		String goPage = "";
		Map<String, String> errors = new HashMap<String, String>();
		
		if(StringUtils.isAllBlank(boardVO.getBoTitle())) {
			errors.put("boTitle", "제목을 입력해주세요!");
		}
		if(StringUtils.isAllBlank(boardVO.getBoContent())) {
			errors.put("boContent", "내용을 입력해주세요!");
		}
		
		if(errors.size() > 0) {
			model.addAttribute("error", errors);
			model.addAttribute("board", boardVO);
			goPage = "pages/ddit_form";
		} else {
			boardVO.setBoWriter("깅밍정");
			ServiceResult result = boardService.insertBoard(boardVO);
			if(result.equals(ServiceResult.OK)) {
				goPage = "redirect:/board/detail.do?boNo=" + boardVO.getBoNo();
			} else {
				errors.put("msg", "에러! 다시 시도해주세요");
				model.addAttribute("errors",errors);
				goPage="pages/ddit_form";
			}
		}
		return goPage;
		
	}
	
	@RequestMapping(value = "/update.do", method = RequestMethod.GET)
	public String boardUpdateForm(int boNo, Model model) {
		BoardVO boardVO = boardService.selectBoard(boNo);
		model.addAttribute("board", boardVO);
		model.addAttribute("status", "u"); //u : update(수정)
		return "pages/ddit_form";
	}
	
	@RequestMapping(value="/update.do", method = RequestMethod.POST)
	public String boardUpdate(BoardVO boardVO, Model model) {
		String goPage = "";
		ServiceResult result = boardService.updateBoard(boardVO);
		if(result.equals(ServiceResult.OK)) {
			goPage = "redirect:/board/detail.do?boNo=" + boardVO.getBoNo();
		} else {
			model.addAttribute("board", boardVO);
			model.addAttribute("status", "u");
			goPage = "pages/ddit_form";
		}
		return goPage;
	}
	
	@RequestMapping(value="/delete.do", method = RequestMethod.POST)
	public String boardDelete(int boNo, Model model) {
		String goPage = "";
		ServiceResult result = boardService.deleteBoard(boNo);
		
		if(result.equals(ServiceResult.OK)) {
			goPage = "redirect:/board/boardlist.do";
		}else {
			goPage = "redirect:/board/detail.do?boNo=" + boNo;
		}
		return goPage;
	}
	
}
